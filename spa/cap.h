/*
 * This header file is for the packet capture-related code that is part of
 * the SIMPLE Packet Associator (spa) project.
 */

#ifndef CAP_H
#define CAP_H

#include <sys/types.h>

/* 
 * This function returns a file descriptor of a pipe read end to an instance
 * of tshark. Returns -1 if there was a failure.
 */
int gettsharkinstance(char *args);

/* 
 * This function returns the pid of the tshark instance, which is useful for
 * sending signals to the process.
 */
pid_t gettsharkpid();

#endif