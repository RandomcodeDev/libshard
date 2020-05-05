#include <stdio.h>
#include <string.h>

#include <shard/libshard.h>

int main(int argc, char **argv)
{
	if (argc > 1)
		printf("%s\n", read_file(argv[1]));
	else
		printf("%s\n", read_file("test.c"));

	return 0;
}
