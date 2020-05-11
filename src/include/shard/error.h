#ifndef __ERROR_H__
#define __ERROR_H__

#include <stdio.h>
#include <stdarg.h>
#include <string.h>

/* Print an error. Intended for use by the library; don't use it. */
void shard_error(const char *message, ...);

#endif /* __ERROR_H__ */
