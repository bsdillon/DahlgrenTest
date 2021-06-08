#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <signal.h>
#include "cap.h"

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
	char buf[256] = {0}; //Change hard-coded size value
	signal(SIGINT, handle_signals);
	capture = 1;
	
	printf("Started tshark with pid %d\n",tspid);
	
	while(fgets(buf, sizeof(buf), tsfile) != NULL)
	{
		printf("%s",buf);
	}
	
	fclose(tsfile);
	close(fd);
	
	wait(&status);
	
	printf("Exiting main program\n");
	
	return 0;
}