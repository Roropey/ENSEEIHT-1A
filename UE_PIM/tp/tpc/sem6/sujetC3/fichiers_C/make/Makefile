all: ephemeride EDT

CC=c99
CFLAGS=-Wextra -pedantic -c
LDFLAGS=

ephemeride: date.o ephemeride.o
	$(CC) $(LDFLAGS) $^ -o $@

date.o: date.c date.h
	$(CC) $(CFLAGS) $<

ephemeride.o: ephemeride.c
	$(CC) $(CFLAGS) $<



clean:
	rm *.o ephemeride
# DO NOT DELETE

EDT.o: cours.h salle.h date.h enseignant.h
cours.o: cours.h salle.h date.h enseignant.h
date.o: date.h
enseignant.o: enseignant.h date.h
ephemeride.o: date.h
salle.o: salle.h date.h
