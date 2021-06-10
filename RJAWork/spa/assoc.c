#define _GNU_SOURCE /* need for asprintf */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "assoc.h"

#define SS_LINE_BUFFER 128
#define WRITE_CHUNK_SIZE 50

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
				   " | awk '{gsub(/\"/, \"\"); print $6}'";
	char *cmdstr; //TODO: Memory leaks here?
	if (0 > asprintf(&cmdstr, cmdfmt, sport, sport, dport, dport))
	{
		fprintf(stderr, "Problem making command string\n");
		exit(1);
	}
	
	char *buf = malloc(sizeof(char) * SS_LINE_BUFFER);
	FILE *fp;

	if((fp=popen(cmdstr, "r"))==NULL)
	{
		printf("Error opening pipe!\n");
		return "ERR";
	}

	while (fgets(buf, SS_LINE_BUFFER, fp) != NULL) 
	{
        //TODO: Right now this assumes there is only one line of ss output
		//		Update this behavior to reflect possibility of multiple lines
    }

    if(pclose(fp))  
	{
        printf("Problem running ss\n");
        return "ERR";
    }
	
	if (strcmp(buf, "\n") == 0)
	{
		return "No socket info";
	}
	
	return buf;
}

int write_info_to_file(char *infile, char *outfile, frame **listhead, int numframes)
{
	frame *currframe = *listhead;
	int iflen = strlen(infile);
	int oflen = strlen(outfile);
	
	size_t numchars = 8 + (11 + MAX_FRAMENUM_BYTES + SS_LINE_BUFFER)
					  * numframes
					  + iflen + oflen + 4;
	
	char *cmdbuf;
	cmdbuf = malloc(sizeof(char) * numchars);
	if (cmdbuf == NULL)
	{
		return -1;
	}
	strncpy(cmdbuf, "editcap", 8);

	while (currframe != NULL)
	{
		strncat(cmdbuf, " -a ", 5);
		strncat(cmdbuf, currframe->framenum, MAX_FRAMENUM_BYTES);
		strncat(cmdbuf, ":\"", 3);
		strncat(cmdbuf, currframe->procinfo, SS_LINE_BUFFER); //Do we need to add a -1 for null?
		strncat(cmdbuf, "\" ", 3);
		
		if (currframe->next == NULL)
		{
			strncat(cmdbuf, infile, iflen + 1);
			strncat(cmdbuf, " ", 2);
			strncat(cmdbuf, outfile, oflen + 1);
			system(cmdbuf);
		}
		currframe = currframe->next;
	}
	
	free(cmdbuf);
	return 0;
}