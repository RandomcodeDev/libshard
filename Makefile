CC=gcc
LD=ld
MAKE=make

SRCDIR=src
INCDIR=src/include
HEADERDIR=$(INCDIR)/shard
OBJDIR=obj
BINDIR=bin

PREFIX=/usr

_CSRC=error.c file.c
CSRC=$(patsubst %,$(SRCDIR)/%,$(_CSRC))

_HEADERS=libshard.h error.h file.h
HEADERS=$(patsubst %,$(HEADERDIR)/%,$(_HEADERS))

_OBJ=error.o file.o
OBJ=$(patsubst %,$(OBJDIR)/%,$(_OBJ))

$(OBJ):
	gcc -c -Wall -fpic $(CSRC) $(HEADERS) -I$(INCDIR)/
	mv *.o $(OBJDIR)/

$(BINDIR)/libshard.so: $(OBJ)
	gcc -shared -o $@ $^

clean:
	rm $(OBJ) $(HEADERDIR)/*.gch

mingw:
	gcc -c -DBUILDING_SHARD $(CSRC) $(HEADERS) -I$(INCDIR)/
	mv *.o $(OBJDIR)/
	gcc -shared -o libshard.dll $(OBJ)

mingw-test: mingw
	gcc -o test.exe test.c -I$(INCDIR)/ -L. -lshard

mingw-install: mingw clean
	cp -r $(HEADERDIR)/ $(PREFIX)/include/
	cp libshard.dll $(PREFIX)/lib/

mingw-uninstall: 
	rm -rf $(PREFIX)/include/ $(PREFIX)/lib/

test: $(BINDIR)/libshard.so
	gcc -o test test.c -I$(INCDIR)/ -Lbin/ -lshard

uninstall:
	rm -rf $(PREFIX)/lib/libshard.so $(PREFIX)/include/shard/
	ldconfig

install: $(BINDIR)/libshard.so clean
	cp $(BINDIR)/libshard.so $(PREFIX)/lib/libshard.so
	cp -r $(HEADERDIR)/ $(PREFIX)/include/
	ldconfig
