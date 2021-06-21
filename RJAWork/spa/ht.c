/*
 * Adapted from https://github.com/engineer-man/youtube/blob/master/077/hashtable.c
 */

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "ht.h"

#define TABLE_SIZE 512

tab_entry * make_entry(char *key, char *value)
{
	tab_entry *entry = malloc(sizeof(tab_entry));
	entry->key = malloc(strlen(key)+1);
	entry->value = malloc(strlen(value)+1);
	strcpy(entry->key, key);
	strcpy(entry->value, value);
	entry->next = NULL;
	return entry;
}

hash_table * create_ht(void)
{
	hash_table *table = malloc(sizeof(hash_table));
	table->entries = malloc(sizeof(tab_entry)*TABLE_SIZE);
	for (int i=0;i<TABLE_SIZE;i++)
	{
		table->entries[i] = NULL;
	}
	
	return table;
}

void print_ht(hash_table *table)
{
	for (int i=0;i<TABLE_SIZE;i++)
	{
		tab_entry *entry = table->entries[i];
		
		if (entry == NULL)
		{
			continue;
		}
		
		printf("Slot[%d]: ", i);
		
		for(;;) {
            printf("%s=%s ", entry->key, entry->value);

            if (entry->next == NULL) {
                break;
            }

            entry = entry->next;
        }

        printf("\n----\n");
	}
}

int hash(char *key)
{
	//TODO: Implement better hash function
	
	long int sum = 0;
	for (int i=0;i<strlen(key);i++)
	{
		sum = sum + key[i];
	}
	
	int ret = sum * 53 % TABLE_SIZE;
	return ret;
}

//TODO: Add checks and return -1 on failure
int ht_add(hash_table *table, char *key, char *value)
{
	int pos = hash(key);
	
	tab_entry *entry = table->entries[pos];
	
	//Key doesn't map to filled spot yet
	if (entry == NULL)
	{
		table->entries[pos] = make_entry(key, value);
		return 0;
	}
	
	tab_entry *last;
	
	while(entry != NULL)
	{
		if(strcmp(entry->key, key) == 0)
		{
			free(entry->value);
			entry->value = malloc(strlen(value)+1);
			strcpy(entry->value, value);
			return 0;
		}
		
		last = entry;
		entry = last->next;
	}
	
	//Key not found
	last->next = make_entry(key, value);
	return 0;
}

char * ht_get(hash_table *table, char *key)
{
	if(key == NULL)
		return NULL;
	
	int pos = hash(key);
	
	tab_entry *entry = table->entries[pos];
	
	if (entry == NULL)
		return NULL;
		
	while(entry != NULL)
	{
		if (strcmp(entry->key, key) == 0)
		{	
			return entry->value;
		}
			
		entry = entry->next;
	}
	
	return NULL; //In case entry wasn't in chain
}