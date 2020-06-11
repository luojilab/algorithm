######################################
#
######################################
#source file
SOURCE  := $(wildcard *.c) $(wildcard *.cpp)
OBJS    := $(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(SOURCE)))

#target you can change lru to what you want

TARGET  := lru

#compile and lib parameter

CC      := gcc
LIBS    :=
LDFLAGS := -lstdc++
DEFINES :=
INCLUDE := -I.
CFLAGS  := -g -Wall -O3 $(DEFINES) $(INCLUDE) -std=c++11
CXXFLAGS:= $(CFLAGS) -DHAVE_CONFIG_H


#i think you should do anything here

.PHONY : everything objs clean veryclean rebuild

everything : $(TARGET)

all : $(TARGET)

objs : $(OBJS)

rebuild: veryclean everything

clean :
	rm -fr *.so
	rm -fr *.o
	rm -fr $(TARGET)

$(TARGET) : $(OBJS)
	$(CC) $(CXXFLAGS) -o $@ $(OBJS) $(LDFLAGS) $(LIBS)