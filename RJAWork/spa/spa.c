/*
 * This is the main code for the SIMPLE Packet Associator project. This
 * application makes use of tshark and editcap to add information about
 * which process a packet is going to or coming from.
 *
 * Current Limitations:
 * 	-will capture any packets tshark will capture
 *	-will only associate ipv4 TCP/UDP packets to processes
 *	-when run as root, pcapng file may not be able to be saved in home dir
 *   (the workaround for this is that the capture file is stored in /tmp/ and
 *    then copied to the working directory after comments are added)
 */

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <signal.h>
#include "spa.h"
#include "cap.h"
#include "assoc.h"

#define MAX_TSHARK_ARGS 20 //No good reason to be 20, just seems reasonable
#define MAX_FNAME_BYTES 32

pid_t tspid;
extern int capture;

/* Handle Ctrl+C to allow stopping tshark */
static void handle_signals(int signum)
{
	switch (signum)
	{
		case SIGINT:
			if (capture != 0)
			{
				kill(tspid, SIGINT);
				int wstatus = 0;
				wait(&wstatus);
				capture = 0;
			}
			else 
			{
				exit(0); //Todo: Behavior when Ctrl+C hit second time
			}
			break;
		default:
			break;
	}
	return;
}

/* Helper function to see inside frame */
void print_frame(frame *f)
{
	printf("Frame:%s\n"
			"\tEthType:%d\n"
			"\tSrcIp:%s\n"
			"\tDestIp:%s\n"
			"\tSrcIp6:%s\n"
			"\tDestIp6:%s\n"
			"\tIpProto:%d\n"
			"\tSrcPrtTcp:%s\n"
			"\tSrcPrtUDP:%s\n"
			"\tDestPrtTCP:%s\n"
			"\tDestPrtUDP:%s\n"
			"\tProcInfo:%s\n", 
			f->framenum, 
			f->ethtype, f->srcip, f->destip,
			f->srcip6, f->destip6, f->ipproto,
			f->srcport_tcp, f->srcport_udp,
			f->destport_tcp,f->destport_udp,
			f->procinfo);
}

void free_list(frame **list)
{
	frame *curr = *list;
	frame *next = (*list)->next;
	while (next != NULL)
	{
		free(curr);
		curr = next;
		next = next->next;
	}
	if (curr != NULL)
	{
		free(curr);
	}
}

/* main() is in WIP status and subject to frequent change */
int main(int argc, char *argv[])
{	
	int opt;
	char **tsargs = malloc(sizeof(char *)*MAX_TSHARK_ARGS);
	memset(tsargs, 0, sizeof(char *)*MAX_TSHARK_ARGS);
	int numargs = 0;
	char *outfile = malloc(sizeof(char)*(MAX_FNAME_BYTES+1));
	strcpy(outfile, "spa.pcapng");
	if(argc > 1)
	{
		while ((opt = getopt(argc, argv, "Di:w:")) != -1)
		{
			switch(opt)
			{
				case 'i':
					tsargs[numargs] = malloc(sizeof(char)*(strlen("-i")+1));
					strcpy(tsargs[numargs], "-i");
					numargs++;
					tsargs[numargs] = malloc(sizeof(char)*(strlen(optarg)+1));
					strcpy(tsargs[numargs], optarg);
					numargs++;
					break;
				case 'D':
					system("tshark -D");
					exit(0);
				case 'w':
					if(strlen(optarg) > MAX_FNAME_BYTES)
					{
						printf("File name must be under %d characters. "
							"Defaulting to \"spa.pcapng\"\n", MAX_FNAME_BYTES);
						break;
					}
					else
					{
						strncpy(outfile, optarg, MAX_FNAME_BYTES);
						outfile[MAX_FNAME_BYTES] = '\0';
					}
					break;
				default:
					printf("Usage: \n");
					exit(1);
			}
		}
	}
	
	int status;
	int fd = get_tshark_instance(tsargs, numargs);
	tspid = get_tshark_pid();
	printf("Started tshark with pid %d\n",tspid);
	
	signal(SIGINT, handle_signals);
	
	frame *list = NULL;
	capture = 1;
	int numframes = capture_frames(fd, &list);
	close(fd);
	wait(&status);
	capture = 0;
	
	printf("\nCaptured %d packets\n", numframes);
	
	write_info_to_file(TMP_FILE_LOC, outfile, &list, numframes);
	
	free(outfile);
	for (int i=0; i<MAX_TSHARK_ARGS; i++)
	{
		if (tsargs[i] != NULL)
		{
			free(tsargs[i]);
		}
	}
	free(tsargs);
	
	if (numframes > 0)
		free_list(&list);
	
	if(DEBUG)
		printf("Exiting main program\n");
	
	return 0;
}