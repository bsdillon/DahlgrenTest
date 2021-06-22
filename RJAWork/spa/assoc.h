/*
 * This file is for code related to associating a captured packet to a
 * running process.
 */

#ifndef ASSOC_H
#define ASSOC_H

#include "spa.h"

/* 
 * Associates a packet to a program by inspecting the owner of the socket 
 * it came in on using ss. Returns 0 on success, 1 on failure to associate. 
 */
int associate_packet(frame *f);


/*
 * Returns process info for ipv4 tcp frame. Uses combination of srcip + srcport
 * and destip + destport to uniquely identify a socket. Makes use of table
 * information.
 */
char * get_proc_info_tcp4(frame *f);


/* WIP */
char * get_proc_info_udp4(frame *f);


/*
 * Uses editcap to write comments to outfile. Returns 0 on success, -1 on 
 * failure.
 */
int write_info_to_file(char *infile, char *outfile, frame **listhead, int numframes);


/*
 * Updates hashtables of socket information.
 */
void update_tables(void);


#endif