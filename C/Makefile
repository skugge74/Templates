# Makefile Template, Skugge74

# Compiler and flags
CC      := gcc
CFLAGS  := -Wall -Wextra -O2

# Directories
SRC_DIR := src
BUILD_DIR := build
BIN := $(BUILD_DIR)/app
TEST_BIN := $(BUILD_DIR)/test

# Source files and objects
SRCS := $(wildcard $(SRC_DIR)/*.c)
TEST_SRC := $(SRC_DIR)/test.c
OBJS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(NON_TEST_SRCS))

# Initialize project structure
init:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p assets
	@mkdir -p $(SRC_DIR)


# Default target
all: $(BIN)

# Link the main binary
$(BIN): $(OBJS)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -o $@ $^

# Compile source files to object files (excluding test.c)
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# Test target (only if test.c exists)
test: $(TEST_SRC)
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -DTEST -o $(TEST_BIN) $(SRCS)
	./$(TEST_BIN)

# Clean build files
clean:
	$(RM) -r $(BUILD_DIR)

# Run the main program
run: $(BIN)
	./$(BIN)

.PHONY: all clean run test
