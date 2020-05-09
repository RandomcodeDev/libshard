#include "shard/file.h"

char *read_file(const char *file, char *buf)
{
	FILE *fp;
	size_t len;

	fp = fopen(file, "rb");
	if (fp == NULL) {
		shard_error("error opening file\n");
		return NULL;
	}

	fseek(fp, 0L, SEEK_END);
	len = ftell(fp);
	rewind(fp);

	buf = (char *)calloc(len + 1, sizeof(char));

	if (buf == NULL) {
		shard_error("error allocating memory for file buffer\n");
		return NULL;
	}

	fread(buf, sizeof(char), len, fp);
	fclose(fp);

	if (buf == NULL) {
		shard_error("error reading file\n");
		return NULL;
	}

	buf[len + 1] = 0;
	return buf;
}
