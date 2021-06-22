#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include "cap.h"

pid_t pid;
extern int capture;

/* 
 * This enum is supposed to match the output order of tshark. Violating the 
 * order will cause undefined behavior.
 */
enum fieldenum {FRAMENUM,ETHTYPE,IPSRC,IPDST,IPPROTO,IP6SRC,IP6DST,IP6NXT,
				TCPSPORT,UDPSPORT,TCPDPORT,UDPDPORT};

int get_tshark_instance(char *args)
{
	/* 
	 * WARNING: If you change the ordering of fields here, make sure you change
	 * the fieldenum above to reflect the order, since filling the frame struct
	 * with info requires that the orders match.
	 */
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
		dup2(tspipe[1], STDOUT_FILENO); //need to check for error here?
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

/*
 * Helper function to try to make parse_line() cleaner. Copies srcstr into
 * member with a max number of bytes of maxsize. Adds a null terminator to
 * end of member to help protect against overflow.
 */
void cpy_to_member(char *member, char *srcstr, int maxsize)
{
	if (srcstr != NULL)
	{
		strncpy(member, srcstr, maxsize);
		if (maxsize > 0)
			member[maxsize-1] = '\0'; //make sure we don't overflow members
	} 
	else
	{
		strcpy(member, "");
	}
}

frame * parse_line(char line[])
{
	char *bufstart = line;
	frame *newframe = malloc(sizeof(frame));
	if (!newframe)
		return NULL;
	newframe->next = NULL;
	int protoset = 0;
	char *token;
	for (int i = FRAMENUM; i<=UDPDPORT; i++)
	{
		token = strsep(&bufstart, ",");
		
		switch (i)
		{
			case FRAMENUM:
				cpy_to_member(newframe->framenum, token, MAX_FRAMENUM_BYTES);
				break;
			case ETHTYPE:
				if(token != NULL)
				{
					newframe->ethtype = strtol(token, NULL, 16);
				}
				else //this means the line from tshark is likely bad
				{
					free(newframe);
					if (DEBUG)
						fprintf(stderr, "Bad line from tshark.\n");
					return NULL;
				}
				break;
			case IPSRC:
				cpy_to_member(newframe->srcip, token, MAX_IP_BYTES);
				break;
			case IPDST:
				cpy_to_member(newframe->destip, token, MAX_IP_BYTES);
				break;
			case IPPROTO:
				if (token != NULL)
				{	
					if (token[0] != '\0')
					{
						newframe->ipproto = atoi(token);
						protoset = 1;
					}
				}
				break;
			case IP6SRC:
				cpy_to_member(newframe->srcip6, token, MAX_IP_6_BYTES);
				break;
			case IP6DST:
				cpy_to_member(newframe->destip6, token, MAX_IP_6_BYTES);
				break;
			case IP6NXT:
				if(protoset != 1)
				{
					if(token != NULL)
						newframe->ipproto = atoi(token);
				}
				break;
			case TCPSPORT:
				cpy_to_member(newframe->srcport_tcp, token, MAX_PORT_BYTES);
				break;
			case TCPDPORT:
				cpy_to_member(newframe->destport_tcp, token, MAX_PORT_BYTES);
				break;
			case UDPSPORT:
				cpy_to_member(newframe->srcport_udp, token, MAX_PORT_BYTES);
				break;
			case UDPDPORT:
				cpy_to_member(newframe->destport_udp, token, MAX_PORT_BYTES);
				break;
			default:
				break;
		}
		
	}
	
	return newframe;
}

int capture_frames(int fd, frame **listhead)
{
	update_tables();
	int flags = fcntl(fd, F_GETFL, 0);
	flags |= O_NONBLOCK;
	fcntl(fd, F_SETFL, flags);
	FILE *tsfile = fdopen(fd, "r");
	char buf[LINE_BUF_SIZE] = {0};
	frame *prevframe = NULL;
	
	int numframes = 0;
	while(capture != 0)
	{
		if(fgets(buf, sizeof(buf), tsfile) != NULL)
		{
			frame *f = parse_line(buf);
			if (f != NULL)
			{
				if (*listhead == NULL)
				{
					*listhead = f;
				}
			
				//update_tables();
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
		}
		else
		{
			update_tables();
		}
	}
	
	//See if there's data still in the pipe
	while (fgets(buf, sizeof(buf), tsfile) != NULL)
	{
		if (DEBUG)
			printf("Packets in pipe after close!\n");
		frame *f = parse_line(buf);
		if (f != NULL)
		{
			if (*listhead == NULL)
			{
				*listhead = f;
			}
			
			//update_tables();
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
	}
	
	
	fclose(tsfile);
	
	return numframes;
}