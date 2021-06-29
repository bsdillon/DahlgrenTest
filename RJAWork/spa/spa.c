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

#define MAX_TSHARK_ARGS 128
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

void print_usage(char *progname)
{
	printf("Usage: %s <options>\n\n", progname);
	printf("Options list:\n");
	printf(" -c <count>\t\tLimit capture to <count> packets\n");
	printf(" -d <file>\t\tDump packet number and process info to file\n");
	printf(" -D\t\t\tDisplay interfaces available for capture\n");
	printf(" -i <interface>\t\tSpecify interface to capture on\n");
	printf(" -s <limit>\t\tSpecify the number of packets to write at a time\n");
	printf(" -w <file>\t\tSpecify the file to write out to\n");
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
	int opt, newsize;
	WRITE_CHUNK_SIZE = 500;
	char **tsargs = malloc(sizeof(char *)*MAX_TSHARK_ARGS);
	memset(tsargs, 0, sizeof(char *)*MAX_TSHARK_ARGS);
	char *dumpfile = malloc(MAX_FNAME_BYTES*sizeof(char));
	int numargs = 0, dump = 0;
	char *outfile = malloc(sizeof(char)*(MAX_FNAME_BYTES+1));
	strcpy(outfile, "spa.pcapng");
	if(argc > 1)
	{
		while ((opt = getopt(argc, argv, "Di:w:c:d:s:h")) != -1)
		{
			switch(opt)
			{
				case 'i':
					if(numargs + 2 < MAX_TSHARK_ARGS - 1)
					{
						tsargs[numargs] = malloc(sizeof(char)*(strlen("-i")+1));
						strcpy(tsargs[numargs], "-i");
						numargs++;
						tsargs[numargs] = malloc(sizeof(char)*(strlen(optarg)+1));
						strcpy(tsargs[numargs], optarg);
						numargs++;
					}
					else
					{
						fprintf(stderr, "Too many arguments!\n");
						exit(1);
					}
					break;
				case 'D':
					system("tshark -D"); //using system() as root may be bad (see man system(3))
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
				case 'c':
					if(numargs + 2 < MAX_TSHARK_ARGS - 1)
					{
						tsargs[numargs] = malloc(sizeof(char)*(strlen("-c")+1));
						strcpy(tsargs[numargs], "-c");
						numargs++;
						tsargs[numargs] = malloc(sizeof(char)*(strlen(optarg)+1));
						strcpy(tsargs[numargs], optarg);
						numargs++;
					}
					else
					{
						fprintf(stderr, "Too many arguments!\n");
						exit(1);
					}
					break;
				case 'd':
					dump = 1;
					strncpy(dumpfile, optarg, MAX_FNAME_BYTES-1);
					dumpfile[MAX_FNAME_BYTES-1] = '\0';
					break;
				case 's':
					newsize = atoi(optarg);
					if (newsize > 0)
						WRITE_CHUNK_SIZE = newsize;
					else
					{
						fprintf(stderr, "Size must be greater than 0\n");
						print_usage(argv[0]);
						exit(1);
					}
					break;
				case 'h':
					print_usage(argv[0]);
					exit(0);
				default:
					print_usage(argv[0]);
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
	
	if(dump)
	{	
		printf("Dumping process info to %s\n", dumpfile);
		dump_frame_info(dumpfile, &list);
	}
	
	if (numframes > 0)
	{
		printf("Writing process info to pcap file...\n");
		dump_frame_info("/tmp/spa.backup", &list);
		int w = write_info_to_file(TMP_FILE_LOC, outfile, &list, numframes);
		if(w == -1)
		{
			fprintf(stderr, "Issue writing frame info to file\n");
		}
	}
	
	free(outfile);
	free(dumpfile);
	for (int i=0; i<MAX_TSHARK_ARGS; i++)
	{
		if (tsargs[i] != NULL)
		{
			free(tsargs[i]);
		}
	}
	free(tsargs);
	
	free_tables();
	
	if (numframes > 0)
		free_list(&list);
	
	if(DEBUG)
		printf("Done!\n");
	
	return 0;
}