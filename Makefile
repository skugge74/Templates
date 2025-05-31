# Compiler and flags
CC      := gcc
CFLAGS  := -Wall -Wextra -O2 -Iinclude

# Directories
SRC_DIR := src
BUILD_DIR := build
BIN := $(BUILD_DIR)/app

# Source and object files
SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

# Default target
all: $(BIN)

# Link the binary
$(BIN): $(OBJS)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -o $@ $^

# Compile source files to object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean build files
clean:
	$(RM) -r $(BUILD_DIR)

# Run the program
run: $(BIN)
	./$(BIN)

.PHONY: all clean run
