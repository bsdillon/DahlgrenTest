/*
 * This file is for code related to associating a captured packet to a
 * running process.
 */

#ifndef ASSOC_H
#define ASSOC_H

#include "spa.h"

/* 
 * Associates a packet to a program by inspecting the owner of the socket 
 * it came in on. Returns 0 on success, 1 on failure to associate. 
 */
int associate_packet(frame *f);


/*
 * Uses editcap to write comments to outfile. Returns 0 on success, -1 on 
 * failure.
 */
int write_info_to_file(char *infile, char *outfile, frame **listhead, int numframes);


/* 
 * Dump frame number and process information out to file 
 */
void dump_frame_info(char *fname, frame **list);


/*
 * Updates hashtables of socket information.
 */
void update_tables(void);


void free_tables(void);


#endif