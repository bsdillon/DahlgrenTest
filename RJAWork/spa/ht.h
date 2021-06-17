/*
 * Header for hash table used by spa.
 */
 
 #ifndef HT_H
 #define HT_H
 
typedef struct tab_entry 
{
	char *key;
	char *value;
	struct tab_entry *next;
} tab_entry;

typedef struct hash_table 
{
	tab_entry **entries;
} hash_table;

hash_table *create_ht(void);

int ht_add(hash_table *table, char *key, char *value);

char * ht_get(hash_table *table, char *key);

void print_ht(hash_table *table);
 
 #endif