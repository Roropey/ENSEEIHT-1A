# Définition des Variables (à compléter)
CC = c99
CFLAGS = -Wextra -pedantic -c 
LDFLAGS = 
EXE = 

# Règles (à compléter avec des variables automatiques)
all: test_file exemple_file

test_file: test_file.o file.o
	$(CC) $(LDFLAGS) $^ -o $@
exemple_file: exemple_file.o file.o
	$(CC) $(LDFLAGS) $^ -o $@

test_file.o: test_file.c file.h
	$(CC) $(CFLAGS) $<
exemple_file.o: exemple_file.c file.h
	$(CC) $(CFLAGS) $<
file.o: file.c file.h
	$(CC) $(CFLAGS) $<

makedepend:
	makedepend *.c -Y
clean:
	rm *.o test_file exemple_file
.PHONY: clean all makedepend

# DO NOT DELETE

exemple_file.o: file.h
file.o: file.h
test_file.o: file.h
