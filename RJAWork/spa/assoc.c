#define _GNU_SOURCE /* need for asprintf */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "assoc.h"

#define SS_LINE_BUFFER 128
#define WRITE_CHUNK_SIZE 50

/* Transport protocol definitions (for deciding how to associate) */
#define PROTO_TCP 6
#define PROTO_UDP 17

/* Eth type definitions (for deciding if packet is ip, ipv6, etc) */
#define ETH_IP 0x0800
#define ETH_IP6 0x86DD

/*
 * Helper function to convert output of ss to frame procinfo format. ss output
 * comes in the form of "((<procname>,<pidinfo>,<fdinfo>))" or like
 * "((<procname>,<pidinfo>,<fdinfo>),(<procname>,<pidinfo>,<fdinfo>),...)"
 */
char * ss_out_to_procinfo_fmt(char *ssline)
{
	char *buf = malloc(sizeof(char)*SS_LINE_BUFFER*2);
	char *pidbuf = malloc(sizeof(char)*80); //just needs to hold some pids
	char *procbuf = malloc(sizeof(char)*SS_LINE_BUFFER); //temp hold names
	pidbuf[0] = '\0';
	procbuf[0] = '\0';
	strcpy(buf, "spaprocnames=(");
	
	char *token = strtok(ssline, ")(,");
	int index = 0;
	while (token != NULL)
	{
		if (index%3==0)
		{
			strcat(procbuf, token); //maybe use strncat (other places too)
			strcat(procbuf, ",");
			token = strtok(NULL, ")(,");
			index++;
		} 
		else if (index%3==1) 
		{
			strcat(pidbuf, token);
			strcat(pidbuf, ",");
			token = strtok(NULL, ")(,");
			index++;
		}
		else
		{
			token = strtok(NULL, ")(,");
			index++;
		}
	}
	
	int j = strlen(procbuf);
	if (procbuf[j-1] == ',')
		procbuf[j-1] = '\0';
		
	j = strlen(pidbuf);
	if (pidbuf[j-1] == ',')
		pidbuf[j-1] = '\0';
	
	strcat(buf, procbuf);
	strcat(buf, ") spapids=(");
	strcat(buf, pidbuf);
	strcat(buf, ")");
	
	free(ssline);
	free(procbuf);
	free(pidbuf);
	
	return buf;
}

/*
 * Helper function for calling ss to get owner of tcp/udp socket. Expects a 
 * format string with 4 %s spots, since sport and dport are each used twice.
 */
char * get_ss_output(char *cmdfmt, char *sport, char *dport)
{
	char *cmdstr;
	if (0 > asprintf(&cmdstr, cmdfmt, sport, dport, dport, sport))
	{
		fprintf(stderr, "Problem making command string\n");
		exit(1);
	}
	
	char *buf = malloc(sizeof(char) * SS_LINE_BUFFER);
	buf[0] = '\0';
	FILE *fp;

	if((fp=popen(cmdstr, "r"))==NULL)
	{
		fprintf(stderr, "Error opening pipe!\n");
		strncpy(buf, "ERR", SS_LINE_BUFFER);
        return buf;
	}

	free(cmdstr);

	fgets(buf, SS_LINE_BUFFER, fp);
	//TODO: Right now this assumes there is only one line of ss output
	//		Update this behavior to reflect possibility of multiple lines

    if(pclose(fp))  
	{
        fprintf(stderr, "Problem running ss\n");
		strncpy(buf, "ERR", SS_LINE_BUFFER);
        return buf;
    }
	
	int j = strlen(buf) - 1;
	if(j == -1)
		j=0;
	if (buf[j] == '\n')
	{
		buf[j] = '\0';
	}
	
	return buf;
}

/*
 * Notes on current implementation:
 * 	-Right now this naively assumes there is only one line of ss output. It
 *	 will only capture the final line of output in its current state.
 *	 (Update this behavior to reflect possibility of multiple lines)
 * 	-If tshark captures a packet whose source and destination are both not the
 *	 current machine, but the current machine has the same port numbers in use,
 *	 it will falsely associate the packet to a process
 *	 (Build in a more proper way to check packet direction and verify whether
 *	  it belongs to this machine)
 */
char * get_proc_info_tcp(char *sport, char *dport)
{
	char *cmdfmt = "ss -tnpH '( sport = :%s and dport = :%s )"
				   " or ( sport = :%s and dport = :%s )'"
				   " | awk '{gsub(/\"/, \"\"); gsub(/users:/, \"\"); print $6}'";
	
	char *buf = get_ss_output(cmdfmt, sport, dport);
	
	if (strcmp(buf, "\n") == 0 || strcmp(buf, "") == 0)
	{
		strncpy(buf, "Failed to get socket info", SS_LINE_BUFFER);
		return buf;
	} 
	else 
	{
		return ss_out_to_procinfo_fmt(buf);
	}
}

char * get_proc_info_udp(char *sport, char *dport)
{
	char *cmdfmt = "ss -unpH '( sport = :%s and dport = :%s )"
				   " or ( sport = :%s and dport = :%s )'"
				   " | awk '{gsub(/\"/, \"\"); gsub(/users:/, \"\"); print $6}'";
	
	char *buf = get_ss_output(cmdfmt, sport, dport);
	
	if (strcmp(buf, "\n") == 0 || strcmp(buf, "") == 0)
	{
		strncpy(buf, "Failed to get socket info", SS_LINE_BUFFER);
		return buf;
	} 
	else 
	{
		return ss_out_to_procinfo_fmt(buf);
	}
}

int associate_packet(frame *f)
{
	char *info = NULL;
	switch (f->ethtype)
	{
		case ETH_IP:
			switch(f->ipproto)
			{
				case PROTO_TCP:
					info = get_proc_info_tcp(f->srcport_tcp, f->destport_tcp);
					strncpy(f->procinfo, info, SS_LINE_BUFFER);
					break;
				case PROTO_UDP:
					info = get_proc_info_udp(f->srcport_tcp, f->destport_tcp);
					strncpy(f->procinfo, info, SS_LINE_BUFFER);
					break;
				default:
					strncpy(f->procinfo, "Unsupported transport protocol", SS_LINE_BUFFER);
					return 1;
			}
			break;
		case ETH_IP6:
			switch(f->ipproto)
			{
				case PROTO_TCP:
					info = get_proc_info_tcp(f->srcport_tcp, f->destport_tcp);
					strncpy(f->procinfo, info, SS_LINE_BUFFER);
					break;
				case PROTO_UDP:
					info = get_proc_info_udp(f->srcport_tcp, f->destport_tcp);
					strncpy(f->procinfo, info, SS_LINE_BUFFER);
					break;
				default:
					strncpy(f->procinfo, "Unsupported transport protocol", SS_LINE_BUFFER);
					return 1;
			}
			break;
		default:
			strncpy(f->procinfo, "Unsupported ethtype", SS_LINE_BUFFER);
			return 1;
	}
	if(info != NULL)
		free(info);
	return 0;
}

int write_info_to_file(char *infile, char *outfile, frame **listhead, int numframes)
{
	if(*listhead == NULL)
		return -1;
	frame *currframe = *listhead;
	int iflen = strlen(infile);
	int oflen = strlen(outfile);
	
	size_t numchars = 8 + (11 + MAX_FRAMENUM_BYTES + SS_LINE_BUFFER) * numframes
					  + iflen + oflen + 4;
	
	char *cmdbuf;
	cmdbuf = malloc(sizeof(char) * numchars);
	if (cmdbuf == NULL)
	{
		return -1;
	}
	strncpy(cmdbuf, "editcap", 8);

	while (currframe != NULL)
	{
		strncat(cmdbuf, " -a ", 5);
		strncat(cmdbuf, currframe->framenum, MAX_FRAMENUM_BYTES);
		strncat(cmdbuf, ":\"", 3);
		strncat(cmdbuf, currframe->procinfo, SS_LINE_BUFFER); //Do we need to add a -1 for null?
		strncat(cmdbuf, "\" ", 3);
		
		if (currframe->next == NULL) //we're one before the end of the list
		{
			strncat(cmdbuf, infile, iflen + 1);
			strncat(cmdbuf, " ", 2);
			strncat(cmdbuf, outfile, oflen + 1);
			system(cmdbuf); //using system() as root may be bad (see man system(3))
		}
		currframe = currframe->next;
	}
	
	free(cmdbuf);
	return 0;
}