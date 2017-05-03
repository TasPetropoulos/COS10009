#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>
#include "terminal_user_input.h"

#define YEAR_TRUMP_ELECTED 2016

// A very basic  read boolean function

bool read_boolean(const char* prompt) {
    my_string answer;
    bool result;

    answer = read_string(prompt);
    answer.str[0] = (char) tolower(answer.str[0]);

    switch (answer.str[0]) {
        case 'n':
            result = false;
            break;
        case 'x':
            result = false;
            break;
        default:
            result = true;
    }
    return result;
}

int trump_age(int year_born) {
    int result = 0;
    result = YEAR_TRUMP_ELECTED - year_born;
    return result;
}

int main() {
    my_string name;
    int age_when_Trump_elected = 0;
    int year_born = 0;
    bool brexit;

    name = read_string("What is your name? ");

    printf("Your name is: %s\n", name.str);

    // Insert code here to read in the year born use read_integer
    year_born = read_integer("What year were you born? ");

    // Put the following calculation in a function:
    age_when_Trump_elected = trump_age(year_born);

    // Print out here " you were X years old when Trump was elected "
    printf("%s, you were %d years old when Trump was elected.\n", name.str, age_when_Trump_elected);

    // Print out a request for the user to say if they support Brexit or not
    // use read_boolean above to get the user's response.
    brexit = read_boolean("Do you support Brexit? ");

    // Have an if statement here and print out whether the user supports Brexit or not.
    if (brexit) {
        printf("You support Brexit!\n");
    } else {
        printf("You don't support Brexit!\n");
    }

    read_string("Type 'exit' to continue: ");

    return 0;
}
