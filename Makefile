CC=gcc
MAKE=make

SRCDIR=src
INCDIR=src/include
HEADERDIR=$(INCDIR)/shard
OBJDIR=obj
BINDIR=bin
GLO_INCDIR=/usr/include
GLO_LIBDIR=/usr/lib

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
	rm $(GLO_LIBDIR)/libshard.so
	rm -r $(GLO_INCDIR)/shard
	ldconfig

.PHONY: install
install: $(BINDIR)/libshard.so
	$(MAKE) clean
	cp $(BINDIR)/libshard.so $(GLO_LIBDIR)/libshard.so
	cp -r $(HEADERDIR) $(GLO_INCDIR)/
	ldconfig
