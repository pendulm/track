#include <time.h>
#include <stdio.h>

typedef unsigned short inode_index_t;

typedef struct data_ref_table {
	inode_index_t entry[13];
} data_ref_table;

typedef struct phy_inode {
	short owner;
	short group;
	char filetype;
	short perm;
	time_t atime;
	time_t wtime;
	time_t itime;
	unsigned int link;
	data_ref_table t; /* more */
	unsigned int size;
} phy_inode;

typedef struct mem_inode {
	phy_inode i;
	/* below are mem only */
	char status;
	short dev_n;
	inode_index_t index;
	struct mem_inode *pre_hash;
	struct mem_inode *next_hash;
	struct mem_inode *pre_free;
	struct mem_inode *next_free;
	short ref_n;
} mem_inode;

int
main(void) {
	printf("%d %d\n", sizeof(phy_inode), sizeof(mem_inode));
	return 0;
}
