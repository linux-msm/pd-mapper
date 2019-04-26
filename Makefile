PD_MAPPER := pd-mapper

CFLAGS := -Wall -g -O2
LDFLAGS := -lqrtr

SRCS := pd-mapper.c \
        json.c \
	servreg_loc.c

OBJS := $(SRCS:.c=.o)

$(PD_MAPPER): $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

install: $(PD_MAPPER)
	install -D -m 755 $< $(DESTDIR)$(prefix)/bin/$<

clean:
	rm -f $(PD_MAPPER) $(OBJS)
