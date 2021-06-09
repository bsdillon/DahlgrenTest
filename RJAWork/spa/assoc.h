/*
 * This file is for code related to associating a captured packet to a
 * running process.
 */

#ifndef ASSOC_H
#define ASSOC_H

/* Returns process name and pid associated to TCP port*/
char * get_proc_info_tcp(char *sport, char *dport);

/* Returns process name and pid associated to UDP port*/
//char * getprocinfoudp(char *sport, char *dport);

#endif