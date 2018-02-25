OBJS = iolib
DBUG = iolib_debug
CC = nasm
CCFLAGS = -felf64
DBFLAGS = $(CCFLAGS) -g
LNK = ld -o


all: clean $(OBJS)

debug: clean $(DBUG)


ch2: iolib.o
	$(LNK) $@ $^

ch2_debug: iolib_debug.o
	$(LNK) $@ -g $^


%_debug.o: %.asm
	$(CC) $(DBFLAGS) $< -o $@

%.o: %.asm
	$(CC) $(CCFLAGS) $< -o $@

clean::
	rm -fr *.o
