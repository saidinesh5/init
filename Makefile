CC=gcc
CFLAGS ?= -pipe -O2 -march=native
PROGS = init shutdown tests
OBJS = builtins.o init.o parser.o util.o devices.o strlcpy.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

all: $(PROGS)

ifeq ($(strip $(INIT_BOOTCHART)),true)
	OBJS += bootchart.o
	CFLAGS += -DBOOTCHART=1
endif

init: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

shutdown: shutdown.o
	$(CC) -o $@ $^ $(CFLAGS)

tests: util.o tests.o
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm -f *~ $(PROGS) $(OBJS) 
