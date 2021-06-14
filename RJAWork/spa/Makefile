CFLAGS  = -g -Wall
LDFLAGS =  
CC	= gcc
LD	= gcc

TARG	= spa

OBJS    = cap.o assoc.o spa.o

TEST = tests


$(TARG): $(OBJS)
	$(LD) $(OBJS) $(LDFLAGS) -o $(TARG)

%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f *.o $(TARG) a.out *.pcapng
