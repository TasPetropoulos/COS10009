#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>
#include <string.h>
#include "terminal_user_input.h"

void file_to_array(int num_lines, char* file_content[128], FILE *file_ptr) {
    char line[128];
    int i = 0;

    while (fgets(line, sizeof(line), file_ptr) != NULL && i != num_lines) {
        file_content[i++] = strdup(line);
    }
}

void print_array(int num_lines, char* file_content[128]) {
    for (int j = 0; j < num_lines; j++) {
        printf("The file contained: %s", file_content[j]);
    }
}

int main() {
    FILE *file_ptr;
    int num_lines;
    char* file_content[128];

    if ((file_ptr = fopen("mytestfile.dat", "r")) == NULL) {
        printf("File could not be opened");
    }
    else {
        fscanf(file_ptr, "%d\n", &num_lines);

        file_to_array(num_lines, file_content, file_ptr);
        print_array(num_lines, file_content);
    }

    fclose(file_ptr);
    return 0;
}
