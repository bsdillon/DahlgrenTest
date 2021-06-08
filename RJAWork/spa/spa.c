/*
 * This is the main code for the SIMPLE Packet Associator project. This
 * application makes use of tshark and editcap to add information about
 * which process a packet is going to or coming from.
 */

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <signal.h>
#include "cap.h"

#define LINE_BUF_SIZE 256

pid_t tspid;
int capture;

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

/* main() is in WIP status and subject to frequent change */
int main(void)
{
	int status;
	int fd = gettsharkinstance("");
	tspid = gettsharkpid();
	FILE *tsfile = fdopen(fd, "r");
	char buf[LINE_BUF_SIZE] = {0};
	signal(SIGINT, handle_signals);
	capture = 1;
	
	printf("Started tshark with pid %d\n",tspid);
	
	while(fgets(buf, sizeof(buf), tsfile) != NULL)
	{
		//Temp code for ensuring the frame is filled properly
		printf("%s",buf);
		frame *f = parseline(buf);
		
		printf("Frame:%s\n"
				   "\tSrcIp:%s\n"
				   "\tSrcPrtTcp:%s\n"
				   "\tSrcPrtUDP:%s\n"
				   "\tDestIp:%s\n"
				   "\tDestPrtTCP:%s\n"
				   "\tDestPrtUDP:%s\n", 
				   f->framenum, 
				   f->srcip, f->srcport_tcp, f->srcport_udp,
				   f->destip,f->destport_tcp,f->destport_udp);
	}
	
	fclose(tsfile);
	close(fd);
	
	wait(&status);
	
	printf("Exiting main program\n");
	
	return 0;
}