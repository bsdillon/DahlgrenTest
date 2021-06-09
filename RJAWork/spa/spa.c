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
#include "cap.h"
#include "assoc.h"

#define LINE_BUF_SIZE 256

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
	int fd = get_tshark_instance("");
	tspid = get_tshark_pid();
	FILE *tsfile = fdopen(fd, "r");
	char buf[LINE_BUF_SIZE] = {0};
	signal(SIGINT, handle_signals);
	capture = 1;
	
	printf("Started tshark with pid %d\n",tspid);
	
	int numframes = 0;
	
	while(fgets(buf, sizeof(buf), tsfile) != NULL)
	{
		//Temp code for ensuring the frame is filled properly
		//printf("%s",buf);
		frame *f = parse_line(buf);
		
		if(strcmp(f->srcport_tcp, "") !=0)
		{
			char *info = get_proc_info_tcp(f->srcport_tcp, f->destport_tcp);
			f->procinfo = info;
		}
		if (f->procinfo == NULL)
		{
			f->procinfo = "Info unavailable";
		}
		
		numframes++;
		
		/*printf("Frame:%s\n"
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
				   f->procinfo);*/
	}
	
	fclose(tsfile);
	close(fd);
	
	wait(&status);
	
	printf("Captured %d frames\n", numframes);
	
	/*waitpid(tspid, &status, 0);
	if(WIFSIGNALED(status))
	{
		capture = 0;
	}; */
	
	printf("Exiting main program\n");
	
	return 0;
}