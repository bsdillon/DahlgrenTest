/*
 * Header for hash table used by spa.
 */
 
 #ifndef HT_H
 #define HT_H
 
/* Struct to store entry in hash table */
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

/* Create a hash table */
hash_table *create_ht(void);

/* Add key/value to a hash table. Replaces value if key exists */
int ht_add(hash_table *table, char *key, char *value);

/* Get value from hash table */
char * ht_get(hash_table *table, char *key);

/* Free memory used by hash table */
void ht_free(hash_table *table);

/* Print the hash table */
void print_ht(hash_table *table);
 
 #endif