/*
 * This file is for code related to associating a captured packet to a
 * running process.
 */

#ifndef ASSOC_H
#define ASSOC_H

#include "cap.h"

/* Returns process name and pid associated to TCP port*/
char * get_proc_info_tcp(char *sport, char *dport);

/* Returns process name and pid associated to UDP port*/
//char * get_proc_info_udp(char *sport, char *dport);

/*
 * Uses editcap to write comments to outfile in chunks of WRITE_CHUNK_SIZE at a
 * time. Returns 0 on success, -1 on failure.
 */
int write_info_to_file(char *outfile, frame **listhead);

#endif