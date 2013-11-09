DEBUG	= -g -O0
#DEBUG	= -O3
CC	= g++
INCLUDE	= -I/usr/local/include
CPPFLAGS	= $(DEBUG) -Wall $(INCLUDE) -Winline -pipe

LDFLAGS	= -L/usr/local/lib
LDLIBS    = -lwiringPi -lwiringPiDev -lpthread -lm

SRC	=	pulseCounter.cpp

OBJ	=	$(SRC:.cpp=.o)

BINS	=	$(SRC:.cpp=)

all:	$(BINS)

pulseCounter:	pulseCounter.o
	@$(CC) -o $@ pulseCounter.o $(LDFLAGS) $(LDLIBS)

.c.o:
	@echo [CC] $<
	@$(CC) -c $(CFLAGS) $< -o $@

clean:
	@echo "[Clean]"
	@rm -f $(OBJ) *~ core tags $(BINS)

