#ifndef __ERROR_H__
#define __ERROR_H__

#include "shard/stdlib_headers.h"

/* Print an error. Intended for use by the library; don't use it. */
void shard_error(const char *message, ...);

#endif /* __ERROR_H__ */
