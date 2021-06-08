#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "cap.h"

pid_t pid;

int gettsharkinstance(char *args)
{
	char *arglist[] = {
		"tshark", "-T", "fields",
		"-e", "frame.number", "-e", "ip.src", "-e", "tcp.srcport", "-e", "udp.srcport",
		"-e", "ip.dst", "-e", "tcp.dstport", "-e", "udp.dstport",
		"-E", "separator=,", "-l", "-p", "-n", "-QP", NULL
		};
	int tspipe[2] = {-1, -1};
	
	//TODO: fix passing args to function (need to add them to arglist)
	
	pipe(tspipe);
	pid = fork();
	
	if (pid < 0)
	{
		perror("cannot fork");
		return 1;
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

pid_t gettsharkpid()
{
	return pid;
}

frame * parseline(char line[])
{
	char *bufstart = line;
	frame *newframe = malloc(sizeof(frame));
	char *token = strsep(&bufstart, ",");
	if (token != NULL)
		strcpy(newframe->framenum, token);
	else
		strcpy(newframe->framenum, "");
	
	token = strsep(&bufstart, ",");
	if (token != NULL)
		strcpy(newframe->srcip, token);
	else
		strcpy(newframe->srcip, "");
	
	token = strsep(&bufstart, ",");
	if (token != NULL)
		strcpy(newframe->srcport_tcp, token);
	else
		strcpy(newframe->srcport_tcp, "");
	
	token = strsep(&bufstart, ",");
	if (token != NULL)
		strcpy(newframe->srcport_udp, token);
	else
		strcpy(newframe->srcport_udp, "");
	
	token = strsep(&bufstart, ",");
	if (token != NULL)
		strcpy(newframe->destip, token);
	else
		strcpy(newframe->destip, "");
	
	token = strsep(&bufstart, ",");
	if (token != NULL)
		strcpy(newframe->destport_tcp, token);
	else
		strcpy(newframe->destport_tcp, "");
	
	token = strsep(&bufstart, ",");
	if (token != NULL)
		strcpy(newframe->destport_udp, token);
	else
		strcpy(newframe->destport_udp, "");
		
	return newframe;
}