#define _GNU_SOURCE /* need for asprintf */

#include <stdio.h>
#include <stdlib.h>
#include "assoc.h"

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
	char *cmdfmt = "ss -tanpH '( sport = :%s or dport = :%s )"
				   " and ( dport = :%s or sport = :%s )'"
				   " | awk '{print $6}'";
	char *cmdstr;
	if (0 > asprintf(&cmdstr, cmdfmt, sport, sport, dport, dport))
	{
		fprintf(stderr, "Problem making command string\n");
		exit(1);
	}
	
	char *buf = malloc(sizeof(char) * 128); //TODO: set up constant for line buffer
	FILE *fp;

	if((fp=popen(cmdstr, "r"))==NULL)
	{
		printf("Error opening pipe!\n");
		return "ERR";
	}

	while (fgets(buf, 128, fp) != NULL) 
	{
        //TODO: Right now this assumes there is only one line of ss output
		//		Update this behavior to reflect possibility of multiple lines
    }

    if(pclose(fp))  {
        printf("Problem running ss\n");
        return "ERR";
    }
	
	return buf;
}