#include <stdio.h>
#include <string.h>
#include "terminal_user_input.h"

#define LOOP_COUNT 60

int main() {
    my_string name;
    int i;

    name = read_string("What is your name? ");

    if (strcmp(name.str, "Pham") == 0) {
        printf("%s, is an awesome name!\n", name.str);
    }
    else if (strcmp(name.str, "Dylan") == 0) {
        printf("Hello, Dylan\n");
    }
    else {
        printf("%s is a ", name.str);

        for (i = 0; i < LOOP_COUNT; ++i) {
            printf("silly, ");
        }
        printf("name!\n");
    }

    return 0;
}
