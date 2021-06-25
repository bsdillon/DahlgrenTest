/*
 * This header file is for structures and functions shared across the whole spa project
 */
 
#ifndef SPA_H
#define SPA_H 

#define MAX_FRAMENUM_BYTES 10
#define MAX_PORT_BYTES 10
#define MAX_IP_BYTES 16
#define MAX_IP_6_BYTES 46
#define TMP_FILE_LOC "/tmp/spa.pcapng"
#define LINE_BUF_SIZE 2048

#define DEBUG 1 //0 for false
 
 /*
 * The frame struct holds the information retrieved from tshark. Each frame has
 * a pointer to the next frame for easy sequential access. ethtype and ipproto
 * are ints for (hopefully) faster comparisons, while port numbers etc are
 * strings because they are sometimes added to strings (and conversion to int
 * would provide little benefit)
 */
typedef struct frame
{
	char framenum[MAX_FRAMENUM_BYTES];
	int  ethtype;
	char srcip[MAX_IP_BYTES];
	char destip[MAX_IP_BYTES];
	char srcip6[MAX_IP_6_BYTES];
	char destip6[MAX_IP_6_BYTES];
	int  ipproto; 
	char srcport_tcp[MAX_PORT_BYTES];
	char srcport_udp[MAX_PORT_BYTES];
	char destport_tcp[MAX_PORT_BYTES];
	char destport_udp[MAX_PORT_BYTES];
	char procinfo[LINE_BUF_SIZE];
	struct frame *next;
} frame;

int capture; //Keep track of whether tshark is open or not
int WRITE_CHUNK_SIZE;

#endif