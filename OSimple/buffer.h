#include "osimple.h"

#define BUF_NUM 1024
#define BUF_HASH_Q_NUM 19

typedef struct buf_h {
	int dev_n;
	int blk_n;
	int status;
	buf_d *data_ptr;
	struct buf_h *pre_hash;
	struct buf_h *next_hash;
	struct buf_h *pre_free;
	struct buf_h *next_free;
} buf_h;

typedef buf_d int[BLK_SIZE]

buf_d buffer_data[BUF_NUM]
buf_h buffer_head[BUF_NUM]
/* the last is free list head */
buf_h buf_hash_queue[BUF_HASH_Q_NUM + 1]

