/*
 * Code for obtaining information on sockets, inodes, and their corresponding
 * process(es).
 */

#ifndef SOCKINFO_H
#define SOCKINFO_H

hash_table *inodepid; //inode -> pid
hash_table *pidprocname; //pid -> process name

/* Initialize the tables */
void si_init_tables(void);

/* Update the tables */
void si_update_tables(void);

/* Free memory used by tables */
void si_free_tables(void);

#endif