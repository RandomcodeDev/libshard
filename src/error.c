#include "shard/error.h"

void shard_error(const char *message, ...)
{
	va_list args;
	va_start(args, message);
	fprintf(stderr, "libshard: in %s: on line %d: ", __FILE__, __LINE__);
	vfprintf(stderr, message, args);
	va_end(args);
}
