CFLAGS  = -g -Wall
LDFLAGS =  -lpthread
CC	= gcc
LD	= gcc

TARG	= spa

OBJS    = cap.o assoc.o spa.o


$(TARG): $(OBJS)
	$(LD) $(OBJS) $(LDFLAGS) -o $(TARG)

%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f *.o $(TARG) a.out 
