#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include "assoc.h"
#include "ht.h"
#include "sockinfo.h"

#define SS_LINE_BUFFER 512
#define WRITE_CHUNK_SIZE 50

/* Transport protocol definitions (for deciding how to associate) */
#define PROTO_TCP 6
#define PROTO_UDP 17

/* Eth type definitions (for deciding if packet is ip, ipv6, etc) */
#define ETH_IP 0x0800
#define ETH_IP6 0x86DD

hash_table *tcptable = NULL;
hash_table *udptable = NULL;
extern hash_table *pidprocname; //In sockinfo.h
extern hash_table *inodepid; //In sockinfo.h

void init_tables(void)
{
	tcptable = create_ht();
	udptable = create_ht();
}

/*
 * Updates connection->inode mapping in tcptable by reading and parsing
 * /proc/net/tcp. Connections are uniquely identified as a combination of
 * srcip + srcport + destip + destport.
 */
void update_tcp_table(void)
{
	if (tcptable == NULL)
		init_tables();
	
	char *fileloc = "/proc/net/tcp";
	FILE *fp = fopen(fileloc, "r");
	if(fp == NULL)
	{
		fprintf(stderr, "Issue reading %s\n", fileloc);
		exit(1);
	}
	char line[LINE_BUF_SIZE];
	
	fgets(line, sizeof(line), fp); //read header line
	
	while(fgets(line, sizeof(line), fp) != NULL)
	{
		unsigned int localadd;
		unsigned int remoteadd;
		int localport;
		int remoteport;
		char inode[20];
		char locals[MAX_IP_BYTES];
		char remotes[MAX_IP_BYTES];
		
		sscanf(line, "%*d: %X:%X %X:%X %*X %*X:%*X %*X:%*X %*X %*d %*d %s %*512s\n",
				&localadd, &localport, &remoteadd, &remoteport, inode);
				
		struct in_addr local;
		struct in_addr remote;
		local.s_addr = localadd;  //NOTE: May need to call htonl here?
		remote.s_addr = remoteadd;//NOTE: May need to call htonl here?
		
		strcpy(locals, inet_ntoa(local));
		strcpy(remotes, inet_ntoa(remote));
		
		char key[MAX_IP_BYTES*2 + MAX_PORT_BYTES*2 + 3];
		snprintf(key, sizeof(key), "%s:%d%s:%d", locals, localport, remotes, remoteport);
		
		if(ht_get(tcptable, key) == NULL)
		{
			ht_add(tcptable, key, inode);
		} 
		else 
		{
			if(strcmp(ht_get(tcptable, key), inode) != 0 && strcmp(inode, "0") != 0)
			{
				ht_add(tcptable, key, inode);
				if(DEBUG)
					printf("Updated %s->%s\n", key, inode);
			}
		}
	}
	fclose(fp);
}

void update_tcp6_table(void)
{
	if (tcptable == NULL)
		init_tables();
	
	char *fileloc = "/proc/net/tcp6";
	FILE *fp = fopen(fileloc, "r");
	if(fp == NULL)
	{
		fprintf(stderr, "Issue reading %s\n", fileloc);
		exit(1);
	}
	char line[LINE_BUF_SIZE];
	
	fgets(line, sizeof(line), fp); //read header line
	
	while(fgets(line, sizeof(line), fp) != NULL)
	{
		int localport;
		int remoteport;
		char inode[20];
		char locals[INET6_ADDRSTRLEN];
		char remotes[INET6_ADDRSTRLEN];
		
		struct in6_addr local;
		struct in6_addr remote;
		
		//ipv6 addresses are weird in the file 
		sscanf(line, "%*d: %08X%08X%08X%08X:%X %08X%08X%08X%08X:%X %*X %*X:%*X %*X:%*X %*X %*d %*d %s %*512s\n",
				&local.s6_addr32[0], &local.s6_addr32[1], &local.s6_addr32[2], &local.s6_addr32[3],
				&localport, 
				&remote.s6_addr32[0], &remote.s6_addr32[1], &remote.s6_addr32[2], &remote.s6_addr32[3],
				&remoteport, inode);
				
		//TODO: Check for ipv4-compatible ipv6 address?
		
		inet_ntop(AF_INET6, &local, locals, INET6_ADDRSTRLEN);
		inet_ntop(AF_INET6, &remote, remotes, INET6_ADDRSTRLEN);
		
		char key[INET6_ADDRSTRLEN*2 + INET6_ADDRSTRLEN*2 + 3];
		snprintf(key, sizeof(key), "%s:%d%s:%d", locals, localport, remotes, remoteport);
		
		if(ht_get(tcptable, key) == NULL)
		{
			ht_add(tcptable, key, inode);
		} 
		else 
		{
			if(strcmp(ht_get(tcptable, key), inode) != 0 && strcmp(inode, "0") != 0)
			{
				ht_add(tcptable, key, inode);
				if(DEBUG)
					printf("Updated %s->%s\n", key, inode);
			}
		}
	}
	fclose(fp);
}

/*
 * Updates connection->inode mapping in udptable by reading and parsing
 * /proc/net/udp. Connections are uniquely identified as a combination of
 * srcip + srcport + destip + destport.
 */
void update_udp_table(void) //TODO: Test no-connection udp data
{
	if (udptable == NULL)
		init_tables();
	
	char *fileloc = "/proc/net/udp";
	FILE *fp = fopen(fileloc, "r");
	if(fp == NULL)
	{
		fprintf(stderr, "Issue reading %s\n", fileloc);
		exit(1);
	}
	char line[4096];
	
	fgets(line, sizeof(line), fp); //read header line
	
	while(fgets(line, sizeof(line), fp) != NULL)
	{
		unsigned int localadd;
		unsigned int remoteadd;
		int localport;
		int remoteport;
		char inode[20];
		char locals[MAX_IP_BYTES];
		char remotes[MAX_IP_BYTES];
		
		sscanf(line, "%*d: %X:%X %X:%X %*X %*X:%*X %*X:%*X %*X %*d %*d %s %*512s\n",
				&localadd, &localport, &remoteadd, &remoteport, inode);
				
		struct in_addr local;
		struct in_addr remote;
		local.s_addr = localadd;  //NOTE: May need to call htonl here?
		remote.s_addr = remoteadd;//NOTE: May need to call htonl here?
		
		strcpy(locals, inet_ntoa(local));
		strcpy(remotes, inet_ntoa(remote));
		
		char key[MAX_IP_BYTES*2 + MAX_PORT_BYTES*2 + 3];
		snprintf(key, sizeof(key), "%s:%d%s:%d", locals, localport, remotes, remoteport);
		
		if(ht_get(udptable, key) == NULL)
		{
			ht_add(udptable, key, inode);
		} 
		else 
		{
			if(strcmp(ht_get(udptable, key), inode) != 0 && strcmp(inode, "0") != 0)
			{
				ht_add(udptable, key, inode);
				if(DEBUG)
					printf("Updated %s->%s\n", key, inode);
			}
		}
	}
	fclose(fp);
}

void update_udp6_table(void)
{
	if (udptable == NULL)
		init_tables();
	
	char *fileloc = "/proc/net/udp6";
	FILE *fp = fopen(fileloc, "r");
	if(fp == NULL)
	{
		fprintf(stderr, "Issue reading %s\n", fileloc);
		exit(1);
	}
	char line[LINE_BUF_SIZE];
	
	fgets(line, sizeof(line), fp); //read header line
	
	while(fgets(line, sizeof(line), fp) != NULL)
	{
		int localport;
		int remoteport;
		char inode[20];
		char locals[INET6_ADDRSTRLEN];
		char remotes[INET6_ADDRSTRLEN];
		
		struct in6_addr local;
		struct in6_addr remote;
		
		//ipv6 addresses are weird in the file 
		sscanf(line, "%*d: %08X%08X%08X%08X:%X %08X%08X%08X%08X:%X %*X %*X:%*X %*X:%*X %*X %*d %*d %s %*512s\n",
				&local.s6_addr32[0], &local.s6_addr32[1], &local.s6_addr32[2], &local.s6_addr32[3],
				&localport, 
				&remote.s6_addr32[0], &remote.s6_addr32[1], &remote.s6_addr32[2], &remote.s6_addr32[3],
				&remoteport, inode);
				
		//TODO: Check for ipv4-compatible ipv6 address?
		
		inet_ntop(AF_INET6, &local, locals, INET6_ADDRSTRLEN);
		inet_ntop(AF_INET6, &remote, remotes, INET6_ADDRSTRLEN);
		
		char key[INET6_ADDRSTRLEN*2 + INET6_ADDRSTRLEN*2 + 3];
		snprintf(key, sizeof(key), "%s:%d%s:%d", locals, localport, remotes, remoteport);
		
		if(ht_get(udptable, key) == NULL)
		{
			ht_add(udptable, key, inode);
		} 
		else 
		{
			if(strcmp(ht_get(udptable, key), inode) != 0 && strcmp(inode, "0") != 0)
			{
				ht_add(udptable, key, inode);
				if(DEBUG)
					printf("Updated %s->%s\n", key, inode);
			}
		}
	}
	fclose(fp);
}

/* Helper function to call all the table update functions */
void update_tables(void)
{
	si_update_tables();
	update_tcp_table();
	update_tcp6_table();
	update_udp_table();
	update_udp6_table();
}

void free_tables(void)
{
	if (tcptable != NULL)
		ht_free(tcptable);
	if (udptable != NULL)
		ht_free(udptable);
	si_free_tables();
}

char * get_proc_info_tcp4(frame *f)
{
	char *key = malloc(strlen(f->srcip)+strlen(f->srcport_tcp)
					   +strlen(f->destip)+strlen(f->destport_tcp)+3); //3 for null and 2 colons
	strcpy(key, f->srcip);
	strcat(key, ":");
	strcat(key, f->srcport_tcp);
	strcat(key, f->destip);
	strcat(key, ":");
	strcat(key, f->destport_tcp);
	
	char *inode = ht_get(tcptable, key);
	if (inode == NULL)
	{
		update_tcp_table();
		inode = ht_get(tcptable, key);
	}
	char *ret = malloc(SS_LINE_BUFFER);
	if(inode != NULL)
	{
		char *pid = ht_get(inodepid, inode);
		char *procname = ht_get(pidprocname, pid);
		snprintf(ret, SS_LINE_BUFFER, "spaprocnames=(%s) spapids=(%s)", procname, pid);
		free(key);
		return ret;
	}
	else //try key other way around
	{
		strcpy(key, f->destip);
		strcat(key, ":");
		strcat(key, f->destport_tcp);
		strcat(key, f->srcip);
		strcat(key, ":");
		strcat(key, f->srcport_tcp);
		inode = ht_get(tcptable, key);
		if (inode != NULL)
		{
			char *pid = ht_get(inodepid, inode);
			char *procname = ht_get(pidprocname, pid);
			snprintf(ret, SS_LINE_BUFFER, "spaprocnames=(%s) spapids=(%s)", procname, pid);
			free(key);
			return ret;
		}
		else
		{
			snprintf(ret, SS_LINE_BUFFER, "Failed to get info");
			free(key);
			return ret;
		}
	}	
}

char * get_proc_info_tcp6(frame *f)
{
	char *key = malloc(strlen(f->srcip6)+strlen(f->srcport_tcp)
					   +strlen(f->destip6)+strlen(f->destport_tcp)+3); //3 for null and 2 colons
	strcpy(key, f->srcip6);
	strcat(key, ":");
	strcat(key, f->srcport_tcp);
	strcat(key, f->destip6);
	strcat(key, ":");
	strcat(key, f->destport_tcp);
	
	char *inode = ht_get(tcptable, key);
	if (inode == NULL)
	{
		update_tcp6_table();
		inode = ht_get(tcptable, key);
	}
	char *ret = malloc(SS_LINE_BUFFER);
	if(inode != NULL)
	{
		char *pid = ht_get(inodepid, inode);
		char *procname = ht_get(pidprocname, pid);
		snprintf(ret, SS_LINE_BUFFER, "spaprocnames=(%s) spapids=(%s)", procname, pid);
		free(key);
		return ret;
	}
	else //try key other way around
	{
		strcpy(key, f->destip6);
		strcat(key, ":");
		strcat(key, f->destport_tcp);
		strcat(key, f->srcip6);
		strcat(key, ":");
		strcat(key, f->srcport_tcp);
		inode = ht_get(tcptable, key);
		if (inode != NULL)
		{
			char *pid = ht_get(inodepid, inode);
			char *procname = ht_get(pidprocname, pid);
			snprintf(ret, SS_LINE_BUFFER, "spaprocnames=(%s) spapids=(%s)", procname, pid);
			free(key);
			return ret;
		}
		else
		{
			snprintf(ret, SS_LINE_BUFFER, "Failed to get info");
			free(key);
			return ret;
		}
	}	
}

char * get_proc_info_udp4(frame *f)
{
	char *key = malloc(strlen(f->srcip)+strlen(f->srcport_udp)
					   +strlen(f->destip)+strlen(f->destport_udp)+3); //3 for null and 2 colons
	strcpy(key, f->srcip);
	strcat(key, ":");
	strcat(key, f->srcport_udp);
	strcat(key, f->destip);
	strcat(key, ":");
	strcat(key, f->destport_udp);
	
	char *inode = ht_get(udptable, key);
	if (inode == NULL)
	{
		update_udp_table();
		inode = ht_get(udptable, key);
	}
	char *ret = malloc(SS_LINE_BUFFER);
	if(inode != NULL)
	{
		char *pid = ht_get(inodepid, inode);
		char *procname = ht_get(pidprocname, pid);
		snprintf(ret, SS_LINE_BUFFER, "spaprocnames=(%s) spapids=(%s)", procname, pid);
		free(key);
		return ret;
	}
	else //try key other way around
	{
		strcpy(key, f->destip);
		strcat(key, ":");
		strcat(key, f->destport_udp);
		strcat(key, f->srcip);
		strcat(key, ":");
		strcat(key, f->srcport_udp);
		inode = ht_get(udptable, key);
		if (inode != NULL)
		{
			char *pid = ht_get(inodepid, inode);
			char *procname = ht_get(pidprocname, pid);
			snprintf(ret, SS_LINE_BUFFER, "spaprocnames=(%s) spapids=(%s)", procname, pid);
			free(key);
			return ret;
		}
		else
		{
			snprintf(ret, SS_LINE_BUFFER, "Failed to get info");
			free(key);
			return ret;
		}
	}
	
}

char * get_proc_info_udp6(frame *f)
{
	char *key = malloc(strlen(f->srcip6)+strlen(f->srcport_udp)
					   +strlen(f->destip6)+strlen(f->destport_udp)+3); //3 for null and 2 colons
	strcpy(key, f->srcip6);
	strcat(key, ":");
	strcat(key, f->srcport_udp);
	strcat(key, f->destip6);
	strcat(key, ":");
	strcat(key, f->destport_udp);
	
	char *inode = ht_get(udptable, key);
	if (inode == NULL)
	{
		update_udp6_table();
		inode = ht_get(udptable, key);
	}
	char *ret = malloc(SS_LINE_BUFFER);
	if(inode != NULL)
	{
		char *pid = ht_get(inodepid, inode);
		char *procname = ht_get(pidprocname, pid);
		snprintf(ret, SS_LINE_BUFFER, "spaprocnames=(%s) spapids=(%s)", procname, pid);
		free(key);
		return ret;
	}
	else //try key other way around
	{
		strcpy(key, f->destip6);
		strcat(key, ":");
		strcat(key, f->destport_udp);
		strcat(key, f->srcip6);
		strcat(key, ":");
		strcat(key, f->srcport_udp);
		inode = ht_get(udptable, key);
		if (inode != NULL)
		{
			char *pid = ht_get(inodepid, inode);
			char *procname = ht_get(pidprocname, pid);
			snprintf(ret, SS_LINE_BUFFER, "spaprocnames=(%s) spapids=(%s)", procname, pid);
			free(key);
			return ret;
		}
		else
		{
			snprintf(ret, SS_LINE_BUFFER, "Failed to get info");
			free(key);
			return ret;
		}
	}
	
}

int associate_packet(frame *f)
{
	char *info = NULL;
	switch (f->ethtype)
	{
		case ETH_IP:
			switch(f->ipproto)
			{
				case PROTO_TCP:
					info = get_proc_info_tcp4(f);
					strncpy(f->procinfo, info, SS_LINE_BUFFER);
					break;
				case PROTO_UDP:
					info = get_proc_info_udp4(f);
					strncpy(f->procinfo, info, SS_LINE_BUFFER);
					break;
				default:
					strncpy(f->procinfo, "Unsupported transport protocol", SS_LINE_BUFFER);
					return 1;
			}
			break;
		case ETH_IP6:
			switch(f->ipproto)
			{
				case PROTO_TCP:
					info = get_proc_info_tcp6(f);
					strncpy(f->procinfo, info, SS_LINE_BUFFER);
					break;
				case PROTO_UDP:
					info = get_proc_info_udp6(f);
					strncpy(f->procinfo, info, SS_LINE_BUFFER);
					break;
				default:
					strncpy(f->procinfo, "Unsupported transport protocol", SS_LINE_BUFFER);
					return 1;
			}
			break;
		default:
			strncpy(f->procinfo, "Unsupported ethtype", SS_LINE_BUFFER);
			return 1;
	}
	if(info != NULL)
		free(info);
	return 0;
}

int write_info_to_file(char *infile, char *outfile, frame **listhead, int numframes)
{
	if(*listhead == NULL)
		return -1;
	frame *currframe = *listhead;
	int iflen = strlen(infile);
	int oflen = strlen(outfile);
	
	size_t numchars = 8 + (11 + MAX_FRAMENUM_BYTES + SS_LINE_BUFFER) * numframes
					  + iflen + oflen + 4;
	
	char *cmdbuf;
	cmdbuf = malloc(sizeof(char) * numchars);
	memset(cmdbuf, '\0', sizeof(char) * numchars);
	if (cmdbuf == NULL)
	{
		return -1;
	}
	strncpy(cmdbuf, "editcap", 8);

	while (currframe != NULL)
	{
		strncat(cmdbuf, " -a ", 5);
		strncat(cmdbuf, currframe->framenum, MAX_FRAMENUM_BYTES);
		strncat(cmdbuf, ":\"", 3);
		strncat(cmdbuf, currframe->procinfo, SS_LINE_BUFFER); //Do we need to add a -1 for null?
		strncat(cmdbuf, "\" ", 3);
		
		if (currframe->next == NULL) //we're one before the end of the list
		{
			strncat(cmdbuf, infile, iflen + 1);
			strncat(cmdbuf, " ", 2);
			strncat(cmdbuf, outfile, oflen + 1);
			system(cmdbuf); //using system() as root may be bad (see man system(3))
		}
		currframe = currframe->next;
	}
	
	free(cmdbuf);
	free_tables();
	return 0;
}