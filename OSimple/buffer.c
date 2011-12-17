#include "buffer.h"
buf_h *buf_free_q_head = buf_hash_queue + BUF_HASH_Q_NUM + 1

buf_h *
getblk(int dev_n, int blk_n) {
	buf_h *p;
redo:
	if ((p = find_buf(dev_n, blk_n)) != NULL) {
		if (p->status == BUF_STS_FREE) {
			p->status = BUF_STS_BUSY;
			/* detach from free queue */
			return p;
		} else {
			sleep_on_this(p);
			goto redo;
		}
	} else {
findnext:
		if ((p = find_free()) != NULL) {
			if (p->status != BUF_STS_DELAY) {
				p->status = BUF_STS_BUSY;
				/* detach from free queue */
				....;
				/* attach to corrct hash queue */
				.....;
			} else {
				async_write();
				goto find_next;
				/* the buffer wait to complete write should be attach to
				 * head of free queue by interupt handler
				 */
			}
		} else {
			sleep_on_any();
			goto redo;
		}
	}

	return p;
}

void
brelse(buf_h *p) {
	wake_up_this(p);
	wake_up_any();
	if (p->status == BUF_STS_OLD) {
		/* attach to head of free queue */
		...;
	} else {
		/* attach to end of free queue */
		...;
	}
}
