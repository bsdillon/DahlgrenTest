#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "cap.h"

pid_t pid;

enum fieldenum {FRAMENUM,ETHTYPE,IPSRC,IPDST,IPPROTO,IP6SRC,IP6DST,IP6NXT,
				TCPSPORT,UDPSPORT,TCPDPORT,UDPDPORT};
				
char * field_num_to_member(int num, frame *f)
{
	switch(num)
	{
		case FRAMENUM:
			return f->framenum;
			break;
		case ETHTYPE:
			return NULL;
			break;
		case IPSRC:
			return f->srcip;
			break;
		case IPDST:
			return f->destip;
			break;
		case IPPROTO:
			return NULL;
			break;
		case IP6SRC:
			return f->srcip6;
			break;
		case IP6DST:
			return f->destip6;
			break;
		case IP6NXT:
			return NULL;
			break;
		case TCPSPORT:
			return f->srcport_tcp;
			break;
		case UDPSPORT:
			return f->srcport_udp;
			break;	
		case TCPDPORT:
			return f->destport_tcp;
			break;
		case UDPDPORT:
			return f->destport_udp;
			break;
		default:
			return NULL;
			break;
	}
}

int get_tshark_instance(char *args)
{
	char *arglist[] = {
		"tshark", "-T", "fields",
		"-e", "frame.number", 
		"-e", "eth.type", 
		"-e", "ip.src", 
		"-e", "ip.dst",
		"-e", "ip.proto",
		"-e", "ipv6.src", 
		"-e", "ipv6.dst",
		"-e", "ipv6.nxt",
		"-e", "tcp.srcport", 
		"-e", "udp.srcport",		
		"-e", "tcp.dstport", 
		"-e", "udp.dstport",
		"-E", "separator=,", 
		"-l", "-p", "-n", "-QP", "-w", TMP_FILE_LOC, NULL
		};
	int tspipe[2] = {-1, -1};
	
	//TODO: fix passing args to function (need to add them to arglist)
	
	pipe(tspipe);
	pid = fork();
	
	if (pid < 0)
	{
		perror("cannot fork");
		return -1;
	}
	if (pid == 0)
	{
		dup2(tspipe[1], STDOUT_FILENO); //need to check for error here
		close(tspipe[1]);
		close(tspipe[0]);
		execvp("tshark", arglist);
	} 
	else
	{
		close(tspipe[1]);
		return(tspipe[0]);
	}
	return -1;
}

pid_t get_tshark_pid()
{
	return pid;
}

frame * parse_line(char line[])
{
	char *bufstart = line;
	frame *newframe = malloc(sizeof(frame));
	if (!newframe)
		return NULL;
	newframe->next = NULL;
	newframe->procinfo = NULL;
	int protoset = 0;
	char *token;
	for (int i = FRAMENUM; i<=UDPDPORT; i++)
	{
		token = strsep(&bufstart, ",");
		if (i != ETHTYPE && i != IPPROTO && i != IP6NXT) //ignore int fields
		{
			if (token != NULL)
				strcpy(field_num_to_member(i, newframe), token);
			else
				strcpy(field_num_to_member(i, newframe), "");
		}
		else
		{
			switch (i) //set int fields
			{
				case ETHTYPE:
					newframe->ethtype = strtol(token, NULL, 16);
					break;
				case IPPROTO:
					if (token != NULL)
					{
						newframe->ipproto = atoi(token);
						protoset = 1;
					}
					break;
				case IP6NXT:
					if(protoset != 1)
						newframe->ipproto = atoi(token);
					break;
				default:
					break;
			}
		}
	}
		
	return newframe;
}

int capture_frames(int fd, frame **listhead)
{
	FILE *tsfile = fdopen(fd, "r");
	char buf[LINE_BUF_SIZE] = {0};
	frame *prevframe = NULL;
	
	int numframes = 0;
	while(fgets(buf, sizeof(buf), tsfile) != NULL)
	{
		frame *f = parse_line(buf);
		if (*listhead == NULL)
		{
			*listhead = f;
		}
		
		associate_packet(f);
		
		if (prevframe == NULL)
		{
			prevframe = f;
		}
		else
		{
			prevframe->next = f;
			prevframe = f;
		}
		
		numframes++;
		
	}
	
	fclose(tsfile);
	
	return numframes;
}