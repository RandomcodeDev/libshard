#ifndef __FILE_H__
#define __FILE_H__

#include <stdio.h>
#include <stdlib.h>

#include "shard/error.h"

/* Read the contents of a file into a buffer */
char *read_file(const char *file, char *buf);

#endif /* __FILE_H__ */
