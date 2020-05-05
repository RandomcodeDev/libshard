#include "shard/file.h"

char *read_file(const char *file)
{
	FILE *fp;
	char *buf;
	size_t len;

	fp = fopen(file, "r");
	if (fp == NULL) {
		shard_error("error opening file\n");
		return NULL;
	}

	fseek(fp, 0L, SEEK_END);
	len = ftell(fp);
	rewind(fp);

	buf = (char *)malloc(len * sizeof(size_t) - 1);
	if (buf == NULL) {
		shard_error("error allocating buffer\n");
		return NULL;
	}

	if (fread(buf, 1, len, fp) == NULL) {
		shard_error("error reading file\n");
		return NULL;
	}

	buf[len] = "\0";
	fclose(fp);
	return buf;
}
