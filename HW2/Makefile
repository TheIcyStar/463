CXX = g++
CXXFLAGS = -Wall -pedantic
CXXFLAGS += -g
TARGET = hw2
SOURCES =

SOURCES += ./hw2.cpp

.PHONY: all clean build

all: build

build: $(TARGET)

$(TARGET): $(SOURCES)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SOURCES)

clean:
	rm -f $(TARGET)

run: $(TARGET)
	./$(TARGET)
