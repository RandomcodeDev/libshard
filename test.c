#include <stdio.h>
#include <string.h>

#include <shard/libshard.h>

int main(int argc, char **argv)
{
	char *buffer;

	if (argc > 1)
		printf("%s\n", read_file(argv[1], buffer));
	else
		printf("%s\n", read_file("test.c", buffer));

	printf("Press return/enter to continue.\n");
	getc(stdin);
	return 0;
}
