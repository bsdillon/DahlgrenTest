/*
 * This is the main code for the SIMPLE Packet Associator project. This
 * application makes use of tshark and editcap to add information about
 * which process a packet is going to or coming from.
 *
 * Current Limitations:
 * 	-will capture any packets tshark will capture
 *	-will only associate ipv4 TCP/UDP packets to processes
 *	-when run as root, pcapng file may not be able to be saved in home dir
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

pid_t tspid;
int capture;

/* Handle Ctrl+C to allow stopping tshark */
static void handle_signals(int signum)
{
	switch (signum)
	{
		case SIGINT:
			if (capture != 0)
			{
				kill(tspid, SIGINT);
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
void printframe(frame *f)
{
	printf("Frame:%s\n"
			"\tSrcIp:%s\n"
			"\tSrcPrtTcp:%s\n"
			"\tSrcPrtUDP:%s\n"
			"\tDestIp:%s\n"
			"\tDestPrtTCP:%s\n"
			"\tDestPrtUDP:%s\n"
			"\tProcInfo:%s\n", 
			f->framenum, 
			f->srcip, f->srcport_tcp, f->srcport_udp,
			f->destip,f->destport_tcp,f->destport_udp,
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
		free(curr);
}

/* main() is in WIP status and subject to frequent change */
int main(void)
{	
	int status;
	int fd = get_tshark_instance("");
	tspid = get_tshark_pid();
	printf("Started tshark with pid %d\n",tspid);
	
	signal(SIGINT, handle_signals);
	
	frame *list = NULL;
	capture = 1;
	int numframes = capture_frames(fd, &list);
	close(fd);
	wait(&status);
	
	printf("Captured %d frames\n", numframes);
	
	write_info_to_file(TMP_FILE_LOC, "spa.pcapng", &list, numframes);
	
	if (numframes > 0)
		free_list(&list);
	
	printf("Exiting main program\n");
	
	return 0;
}