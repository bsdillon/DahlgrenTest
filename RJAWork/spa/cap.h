/*
 * This header file is for the packet capture-related code that is part of
 * the SIMPLE Packet Associator (spa) project.
 */

#ifndef CAP_H
#define CAP_H

#include <sys/types.h>
#include "spa.h"
#include "assoc.h"

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
 * pointer to a frame with the line's information parsed. Returns NULL on
 * error.
 */
frame * parse_line(char line[]);

/*
 * Takes file descriptor to tshark pipe and returns the number of captured
 * packets
 */
int capture_frames(int fd, frame **listhead);

#endif