CC=gcc
CFLAGS=-Iinclude -Wall

OBJ=src/main.o src/syscalls.o src/events.o src/shortcuts.o src/utils.o

all: shield

shield: $(OBJ)
	$(CC) $(OBJ) -o shield

clean:
	rm -f src/*.o shield
