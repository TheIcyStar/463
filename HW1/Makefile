CXX = g++
CXXFLAGS = -Wall -pedantic
CXXFLAGS += -g
TARGET = hw1
SOURCES =

SOURCES += ./hw1p1.cpp

.PHONY: all clean build

all: build

build: $(TARGET)

$(TARGET): $(SOURCES)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SOURCES)

clean:
	rm -f $(TARGET)

run: $(TARGET)
	./$(TARGET)
