#define _GNU_SOURCE /* need for asprintf */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include "assoc.h"
#include "ht.h"
#include "sockinfo.h"

#define SS_LINE_BUFFER 512
#define WRITE_CHUNK_SIZE 50

/* Transport protocol definitions (for deciding how to associate) */
#define PROTO_TCP 6
#define PROTO_UDP 17

/* Eth type definitions (for deciding if packet is ip, ipv6, etc) */
#define ETH_IP 0x0800
#define ETH_IP6 0x86DD

hash_table *tcptable = NULL;
hash_table *udptable = NULL;
extern hash_table *pidprocname;
extern hash_table *inodepid;

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
	if (sport != NULL && dport != NULL)
	{
		if (0 > asprintf(&cmdstr, cmdfmt, sport, dport, dport, sport))
		{
			fprintf(stderr, "Problem making command string\n");
			exit(1);
		}
	}
	else
	{
		cmdstr = malloc(strlen(cmdfmt)+1);
		strcpy(cmdstr, cmdfmt);
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

FILE * get_ss_instance(char *cmd)
{
	FILE *fp;
	if((fp=popen(cmd, "r"))==NULL)
	{
		fprintf(stderr, "Error opening ss pipe!\n");
	}
	
	return fp;
}

void init_tables(void)
{
	tcptable = create_ht();
	udptable = create_ht();
}

void update_tcp_table(void)
{
	//TODO: TCP Hash table info
	if (tcptable == NULL)
		init_tables();
		
	FILE *fp = fopen("/proc/net/tcp", "r");
	if(fp == NULL)
	{
		fprintf(stderr, "Issue reading /proc/net/tcp\n");
		exit(1);
	}
	char line[4096];
	
	fgets(line, sizeof(line), fp); //read header line
	
	while(fgets(line, sizeof(line), fp) != NULL)
	{
		unsigned int localadd;
		unsigned int remoteadd;
		int localport;
		int remoteport;
		char inode[20];
		char locals[MAX_IP_BYTES];
		char remotes[MAX_IP_BYTES];
		
		sscanf(line, "%*d: %X:%X %X:%X %*X %*X:%*X %*X:%*X %*X %*d %*d %s %*512s\n",
				&localadd, &localport, &remoteadd, &remoteport, inode);
				
		struct in_addr local;
		struct in_addr remote;
		local.s_addr = localadd;  //NOTE: May need to call htonl here?
		remote.s_addr = remoteadd;//NOTE: May need to call htonl here?
		
		strcpy(locals, inet_ntoa(local));
		strcpy(remotes, inet_ntoa(remote));
		
		char key[MAX_IP_BYTES*2 + MAX_PORT_BYTES*2 + 3];
		snprintf(key, sizeof(key), "%s:%d%s:%d", locals, localport, remotes, remoteport);
		
		if(ht_get(tcptable, key) == NULL)
		{
			ht_add(tcptable, key, inode);
			//printf("======NEW TABLE======\n");
			//print_ht(tcptable);
		} 
		else 
		{
			if(strcmp(ht_get(tcptable, key), inode) != 0 && strcmp(inode, "0") != 0)
			{
				ht_add(tcptable, key, inode);
				printf("Updated %s->%s\n", key, inode);
			}
		}
		
		
	}
	fclose(fp);
}

void update_udp_table(void)
{
	//TODO: UDP Hash table info
	if (udptable == NULL)
		init_tables();
}

void update_tables(void)
{
	si_update_tables();
	update_tcp_table();
	update_udp_table();
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

char * get_proc_info_tcp4_alt(frame *f)
{
	char *key = malloc(strlen(f->srcip)+strlen(f->srcport_tcp)
					   +strlen(f->destip)+strlen(f->destport_tcp)+3); //3 for null and 2 colons
	strcpy(key, f->srcip);
	strcat(key, ":");
	strcat(key, f->srcport_tcp);
	strcat(key, f->destip);
	strcat(key, ":");
	strcat(key, f->destport_tcp);
	//printf("Trying key: %s\n", key);
	char *inode = ht_get(tcptable, key);
	char *ret = malloc(SS_LINE_BUFFER);
	if(inode != NULL)
	{
		char *pid = ht_get(inodepid, inode);
		char *procname = ht_get(pidprocname, pid);
		snprintf(ret, SS_LINE_BUFFER, "spaprocnames=(%s) spapids=(%s)", procname, pid);
		return ret;
	}
	else //try key other way around
	{
		strcpy(key, f->destip);
		strcat(key, ":");
		strcat(key, f->destport_tcp);
		strcat(key, f->srcip);
		strcat(key, ":");
		strcat(key, f->srcport_tcp);
		inode = ht_get(tcptable, key);
		if (inode != NULL)
		{
			char *pid = ht_get(inodepid, inode);
			char *procname = ht_get(pidprocname, pid);
			snprintf(ret, SS_LINE_BUFFER, "spaprocnames=(%s) spapids=(%s)", procname, pid);
			return ret;
		}
		else
		{
			snprintf(ret, SS_LINE_BUFFER, "Failed to get info");
			return ret;
		}
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
					//info = get_proc_info_tcp(f->srcport_tcp, f->destport_tcp);
					info = get_proc_info_tcp4_alt(f);
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
	//if(info != NULL)
		//free(info);
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