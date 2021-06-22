CFLAGS  = -g -Wall
LDFLAGS =  
CC	= gcc
LD	= gcc

TARG	= spa

OBJS    = cap.o assoc.o ht.o spa.o sockinfo.o

TEST = tests
TESTCANDS = assoc.c cap.c ht.c sockinfo.c

$(TARG): $(OBJS)
	$(LD) $(OBJS) $(LDFLAGS) -o $(TARG)

%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f *.o $(TARG) a.out *.pcapng $(TEST)/test
	
test: clean
	$(CC) $(CFLAGS) $(TESTCANDS) $(TEST)/ftest.c -o $(TEST)/test -lcriterion
	./$(TEST)/test