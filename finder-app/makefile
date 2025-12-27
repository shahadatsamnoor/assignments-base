CC = $(CROSS_COMPILE)gcc
CFLAGS = -g

default: writer.o
	$(CC) -o writer writer.o

writer.o:
	$(CC) -c writer.c -o writer.o

clean:
	rm -f writer writer.o