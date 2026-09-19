CC     = gcc
CFLAGS = -Wall -g -Isrc -Ilib

TARGET = bin/main.exe

OBJS = obj/main.o obj/code.o obj/tests.o obj/unity.o

all: $(TARGET)

$(TARGET): $(OBJS) | bin
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET)

bin:
	mkdir -p bin

obj/main.o: src/main.c | obj
	$(CC) $(CFLAGS) -c src/main.c -o obj/main.o

obj/code.o: src/code.c | obj
	$(CC) $(CFLAGS) -c src/code.c -o obj/code.o

obj/tests.o: src/tests.c | obj
	$(CC) $(CFLAGS) -c src/tests.c -o obj/tests.o

obj/unity.o: src/unity.c | obj
	$(CC) $(CFLAGS) -c src/unity.c -o obj/unity.o

obj:
	mkdir -p obj

clean:
	rm -rf obj bin