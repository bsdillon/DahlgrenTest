/*
 * Socket info code
 */
 
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
#include <unistd.h>
#include <dirent.h>
#include <ctype.h>
#include "ht.h"
#include "sockinfo.h"

#define MAX_PID_BYTES 20
#define MAX_FD_BYTES 10
#define MAX_CMDLINE_BYTES 128 //Process name bytes


void si_init_tables(void)
{
	inodepid = create_ht();
	pidprocname = create_ht();
	
	si_update_tables();
}

char * get_proc_name(char *pid)
{
	if (pid == NULL)
		return NULL;
	int maxlen = MAX_PID_BYTES + 15;
	char path[maxlen];
	
	snprintf(path, maxlen, "/proc/%s/cmdline", pid);
	
	FILE *fp = fopen(path, "r");
	if (fp == NULL)
	{
		fprintf(stderr, "Problem opening /proc/%s/cmdline\n", pid);
		//exit(1);
		return NULL; //TODO: Handle issues better here
	}
	
	char *procname = malloc(MAX_CMDLINE_BYTES);
	procname[0] = '\0';
	fscanf(fp, "%127s", procname); //might end up with args appended?
	fclose(fp);

	char *test = ht_get(pidprocname, pid);
	if (test == NULL || strcmp(procname, "") != 0)
	{	
		ht_add(pidprocname, pid, procname); //Call this in caller maybe?
	}
	
	return procname;
	
}

void get_pid_inodes(char *pid)
{
	if (pid == NULL)
		return;
	char dirname[MAX_PID_BYTES + 10];
	
	int dirlen = strlen(pid) + 10;
	snprintf(dirname, dirlen, "/proc/%s/fd", pid);
	
	DIR *dir = opendir(dirname);
	
	if(!dir)
	{
		fprintf(stderr, "Issue opening process directory for pid %s\n", pid);
		return;
	}
	
	struct dirent *entry;
	
	while((entry = readdir(dir)))
	{
		if (entry->d_type != DT_LNK)
			continue;
		
		int flen = dirlen + strlen(entry->d_name) + 1;
		char fname[10 + MAX_PID_BYTES + 1 + MAX_FD_BYTES];
		
		snprintf(fname, flen, "%s/%s", dirname, entry->d_name);
		
		int llen = 80;
		char lname[llen];
		int used = readlink(fname, lname, llen-1);
		if (used == 0)
			continue;
		lname[used] = '\0';
		
		if(strncmp(lname, "socket:[", 8) == 0)
		{
			char sock[MAX_PID_BYTES];
			sscanf(lname, "socket:[%[^]]", sock);
			ht_add(inodepid, sock, pid);
		}
	}
	
	closedir(dir);
}

/* Returns 0 if false, 1 if true */
int isnum(char *str)
{
	if (str == NULL)
		return 0;
	for(int i=0;i<strlen(str);i++)
	{
		if(!isdigit(str[i]))
			return 0;
	}
	
	return 1;
}

void si_update_tables(void)
{
	if(inodepid == NULL)
	{
		si_init_tables(); //TODO: move somewhere else so check isn't done each frame
	}
	
	DIR *dir = opendir("/proc");
	if (!dir)
	{
		fprintf(stderr, "Could not open /proc\n");
	}
	
	struct dirent *entry;
	
	while ((entry=readdir(dir)))
	{
		if (entry->d_type != DT_DIR)
			continue;
		
		if (isnum(entry->d_name) == 0)
			continue;
		
		get_pid_inodes(entry->d_name);
		char *proc = get_proc_name(entry->d_name);
		free(proc);
	}
	closedir(dir);
}

/*
int main(int argc, char *argv[])
{
	si_init_tables();
	si_update_tables();
	
	print_ht(inodepid);
	print_ht(pidprocname);
	
	return 0;
}
*/