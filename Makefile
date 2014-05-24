.PHONY: all clean

CHOST = i686-pc-mingw32
CC = $(CHOST)-gcc

CFLAGS = -g -O2 -Wall
CPATHS = $(foreach dir,$(wildcard /usr/$(CHOST)/usr/lib/binutils/$(CHOST)/*),-I$(dir)/include -L$(dir))

all : backtrace.dll test.exe

backtrace.dll : backtrace.c
	$(CC) -shared $(CFLAGS) $(CPATHS) -g0 -D PACKAGE='"backtrace.dll"' -o $@ $^ -lbfd -liberty -limagehlp -lz

test.exe : test.c
	$(CC) $(CFLAGS) -o $@ $^

clean :
	-rm -f backtrace.dll test.exe
