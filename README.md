# libshard
A simple utility library written in C.

### How to install
NO MATTER YOUR PLATFORM, issue `mkdir bin obj` before doing anything else. If you don't do this, the Makefile won't work. To compile the library, simply type `make` into a shell and then type `sudo make install`.

### How to use the library
Just include `shard/libshard.h` in your program. To compile a program using the library, use `-lshard` with gcc. You can also compile the example program (`test.c`) with `make test`. It demonstrates some basic features of the library. Currently, the library only provides a function for reading files, but more will come, and when I have time so will a wiki documenting the library.

### MinGW
To set up the library on MinGW, use `make mingw` and `make mingw-install -e PREFIX=<MinGW install root>`. Linking is the same (as in just add `-lshard` to your gcc command). You can build the example with `make mingw-test`.
