/*
 * This header file is for the packet capture-related code that is part of
 * the SIMPLE Packet Associator (spa) project.
 */

#ifndef CAP_H
#define CAP_H

#include <sys/types.h>

#define MAX_FRAMENUM_BYTES 10
#define MAX_PORT_BYTES 10
#define MAX_IP_BYTES 16
#define MAX_IP_6_BYTES 46
#define TMP_FILE_LOC "/tmp/spa.pcapng"

/*
 * The frame struct holds the information retrieved from tshark. Each frame has
 * a pointer to the next frame for easy sequential access.
 */
typedef struct frame
{
	char framenum[MAX_FRAMENUM_BYTES];
	int  ethtype;
	char srcip[MAX_IP_BYTES];
	char destip[MAX_IP_BYTES];
	char srcip6[MAX_IP_6_BYTES];
	char destip6[MAX_IP_6_BYTES];
	int  ipproto; //TODO: Constant?
	char srcport_tcp[MAX_PORT_BYTES];
	char srcport_udp[MAX_PORT_BYTES];
	char destport_tcp[MAX_PORT_BYTES];
	char destport_udp[MAX_PORT_BYTES];
	char *procinfo;
	struct frame *next;
} frame;

/* 
 * This function returns a file descriptor of a pipe read end to an instance
 * of tshark. Returns -1 if there was a failure.
 */
int get_tshark_instance(char *args);

/* 
 * This function returns the pid of the tshark instance, which is useful for
 * sending signals to the process.
 */
pid_t get_tshark_pid();

/*
 * This function parses a line from tshark's curated output and returns a
 * pointer to a frame with the line's information parsed.
 */
frame * parse_line(char line[]);

#endif