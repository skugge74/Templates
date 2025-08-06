# Makefile Template, Skugge74++

NAME     ?= app
CC       := gcc
CFLAGS   := -Wall -Wextra -O2 -Iinclude
SRC_DIR  := src
BUILD_DIR := build
BIN      := $(BUILD_DIR)/$(NAME)
TEST_DIR := test
TEST_BIN := $(BUILD_DIR)/test

SRCS := $(filter-out $(SRC_DIR)/test.c, $(wildcard $(SRC_DIR)/*.c))
OBJS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

all: $(BIN)

init:
	@echo "Initializing project..."
	@mkdir -p $(SRC_DIR) $(BUILD_DIR) $(TEST_DIR) include assets

	@echo '#ifndef FUNCTIONS_H' > include/functions.h
	@echo '#define FUNCTIONS_H' >> include/functions.h
	@echo '' >> include/functions.h
	@echo 'int add(int a, int b);' >> include/functions.h
	@echo '' >> include/functions.h
	@echo '#endif // FUNCTIONS_H' >> include/functions.h

	@echo '#include "functions.h"' > $(SRC_DIR)/functions.c
	@echo '' >> $(SRC_DIR)/functions.c
	@echo 'int add(int a, int b) {' >> $(SRC_DIR)/functions.c
	@echo '    return a + b;' >> $(SRC_DIR)/functions.c
	@echo '}' >> $(SRC_DIR)/functions.c

	@echo '#include "functions.h"' > $(SRC_DIR)/main.c
	@echo '#include <stdio.h>' >> $(SRC_DIR)/main.c
	@echo '' >> $(SRC_DIR)/main.c
	@echo '#ifndef TEST' >> $(SRC_DIR)/main.c
	@echo 'int main() {' >> $(SRC_DIR)/main.c
	@echo '    printf("Result: %d\\n", add(3, 4));' >> $(SRC_DIR)/main.c
	@echo '    return 0;' >> $(SRC_DIR)/main.c
	@echo '}' >> $(SRC_DIR)/main.c
	@echo '#endif' >> $(SRC_DIR)/main.c

	@echo '#include "../include/functions.h"' > $(TEST_DIR)/test.c
	@echo '#include <stdio.h>' >> $(TEST_DIR)/test.c
	@echo '' >> $(TEST_DIR)/test.c
	@echo '#ifdef TEST' >> $(TEST_DIR)/test.c
	@echo 'int main() {' >> $(TEST_DIR)/test.c
	@echo '    printf("Testing add: %d\\n", add(10, 5));' >> $(TEST_DIR)/test.c
	@echo '    return 0;' >> $(TEST_DIR)/test.c
	@echo '}' >> $(TEST_DIR)/test.c
	@echo '#endif' >> $(TEST_DIR)/test.c


$(BIN): $(OBJS)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

test:
ifeq ($(wildcard $(TEST_DIR)/test.c),)
	@echo "No test.c found in $(TEST_DIR)"
else
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -DTEST -o $(TEST_BIN) $(SRCS) $(TEST_DIR)/test.c
	@echo "Running tests..."
	./$(TEST_BIN)
endif

run: $(BIN)
	@echo "Running $(BIN)..."
	./$(BIN)

clean:
	$(RM) -r $(BUILD_DIR)

.PHONY: all clean run test init
