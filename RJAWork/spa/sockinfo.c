/*
 * Socket info code. Some code inspired by nethogs. See 
 * https://github.com/raboof/nethogs for more information. I don't think it's
 * similar enough to cause licensing issues.
 */
 
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
#include <unistd.h>
#include <dirent.h>
#include <ctype.h>
#include "ht.h"
#include "sockinfo.h"
#include "spa.h"

#define MAX_PID_BYTES 20
#define MAX_FD_BYTES 10
#define MAX_CMDLINE_BYTES 128 //Process name bytes


void si_init_tables(void)
{
	inodepid = create_ht();
	pidprocname = create_ht();
	
	si_update_tables();
}

void si_free_tables(void)
{
	if (inodepid != NULL)
		ht_free(inodepid);
	if (pidprocname != NULL)
		ht_free(pidprocname);
}

/*
 * Reads /proc/<pid>/cmdline for process name. Adds pid->process name mapping
 * to pidprocname. Returns process name on success, NULL on failure. Call free
 * on return value.
 */
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
		if(DEBUG)
			fprintf(stderr, "Problem opening /proc/%s/cmdline\n", pid);
		return NULL; //TODO: Handle issues better here?
	}
	
	char *procname = malloc(MAX_CMDLINE_BYTES);
	procname[0] = '\0';
	fscanf(fp, "%127s", procname); //might end up with args appended?
	fclose(fp);

	char *test = ht_get(pidprocname, pid);
	if (test == NULL || strcmp(procname, "") != 0)
	{	
		ht_add(pidprocname, pid, procname);
	}
	
	return procname;
	
}

/* Iterates through /proc/<pid>/fd and adds inode->pid mapping to inodepid */
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
		if(DEBUG)
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
		
		int buflen = 80;
		char buf[buflen];
		memset(buf, '\0', buflen);
		int bytes = readlink(fname, buf, buflen-1);
		if (bytes == 0)
			continue; //If readlink() doesn't put anything into buf
		buf[bytes] = '\0'; //Make sure string terminates
		
		if(strncmp(buf, "socket:[", 8) == 0)
		{
			char sock[MAX_PID_BYTES];
			sscanf(buf, "socket:[%[^]]", sock);
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

/* Function for updating tables */
void si_update_tables(void)
{
	if(inodepid == NULL)
	{
		si_init_tables();
	}
	
	DIR *dir = opendir("/proc");
	if (!dir)
	{
		if(DEBUG)
			fprintf(stderr, "Could not open /proc\n");
	}
	
	struct dirent *entry;
	
	while ((entry=readdir(dir))) //iterate through /proc
	{
		if (entry->d_type != DT_DIR) //if not a directory
			continue;
		
		if (isnum(entry->d_name) == 0) //if not a pid 
			continue;
		
		get_pid_inodes(entry->d_name);
		char *proc = get_proc_name(entry->d_name);
		if (proc != NULL)
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