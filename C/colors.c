#include "colors.h"
#include <stdio.h>

// Example usage functions
void print_colored(const char* color, const char* text) {
    printf("%s%s%s", color, text, RESET);
}

void print_error(const char* message) {
    print_colored(RED, message);
}

void print_success(const char* message) {
    print_colored(GRN, message);
}

void print_warning(const char* message) {
    print_colored(YEL, message);
}

void print_info(const char* message) {
    print_colored(BLU, message);
}