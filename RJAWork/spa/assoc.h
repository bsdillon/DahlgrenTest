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

/* Returns process name and pid associated to TCP port */
char * get_proc_info_tcp(char *sport, char *dport);

/* Returns process name and pid associated to UDP port */
char * get_proc_info_udp(char *sport, char *dport);

/*
 * Uses editcap to write comments to outfile in chunks of WRITE_CHUNK_SIZE at a
 * time. Returns 0 on success, -1 on failure.
 */
int write_info_to_file(char *infile, char *outfile, frame **listhead, int numframes);

#endif