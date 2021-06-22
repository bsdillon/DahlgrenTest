/*
 * Code for obtaining information on sockets, inodes, and their corresponding
 * process(es).
 */

#ifndef SOCKINFO_H
#define SOCKINFO_H

hash_table *inodepid; //inode -> pid
hash_table *pidprocname; //pid -> process name

void si_init_tables(void);
void si_update_tables(void);

#endif