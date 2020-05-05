CC=gcc
MAKE=make

SRCDIR=src
INCDIR=src/include
HEADERDIR=$(INCDIR)/shard
OBJDIR=obj
BINDIR=bin

_CSRC=error.c file.c
CSRC=$(patsubst %,$(SRCDIR)/%,$(_CSRC))

_HEADERS=libshard.h error.h file.h stdlib_headers.h
HEADERS=$(patsubst %,$(HEADERDIR)/%,$(_HEADERS))

_OBJ=error.o file.o
OBJ=$(patsubst %,$(OBJDIR)/%,$(_OBJ))

$(OBJ):
	gcc -c -Wall -fpic $(CSRC) $(HEADERS) -I$(INCDIR)/
	mv *.o $(OBJDIR)

$(BINDIR)/libshard.so: $(OBJ)
	gcc -shared -o $@ $^

.PHONY: clean
clean:
	rm $(OBJ) $(HEADERDIR)/*.gch

.PHONY: uninstall
uninstall:
	rm /usr/lib/libshard.so
	rm -r /usr/include/shard
	ldconfig

.PHONY: install
install: $(BINDIR)/libshard.so
	$(MAKE) clean
	cp $(BINDIR)/libshard.so /usr/lib/libshard.so
	cp -r $(HEADERDIR) /usr/include/
	ldconfig
