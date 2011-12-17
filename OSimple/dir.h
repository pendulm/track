#include "osimple.h"
#include "inode.h"

#define FILE_NAME_LEN 14
#define DIR_ITEM_NUM (BLK_SIZE / sizeof(dir_item))

typedef struct {
	char name[FILE_NAME_LEN];
	inode_index_t inode;
} dir_item;

typedef struct {
	dir_item item[DIR_ITEM_NUM];
}
