#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "terminal_user_input.h"

struct Album {
    char title[30];
    char artist[30];
    char tracklist[30][20];
    char trackpath[30][20];
    int tracks, genre;
} album;

struct Album albums[20];
int album_no = 0;
FILE *afile;


// Misc Functions {{{

void print_array(int num_lines, char* array[128]) {
    for (int i = 0; i < num_lines; i++) {
        printf("%s\n", array[i]);
    }
}

void clear_screen() {
    printf("\e[1;1H\e[2J");
}

// }}}

// Genres {{{

char * get_genre_name(int genre) {
    char * genre_name;

    switch (genre) {
        case 1:
            genre_name = "Rock";
            break;
        case 2:
            genre_name = "Pop";
            break;
        case 3:
            genre_name = "Jazz";
            break;
        case 4:
            genre_name = "Rap";
            break;
        case 5:
            genre_name = "Folk";
            break;
        default:
            genre_name = "Unknown";
    }

    return genre_name;
}

int read_genre() {
    printf("Genres:\n");
    printf("  1. Rock\n");
    printf("  2. Pop\n");
    printf("  3. Jazz\n");
    printf("  4. Rap\n");
    printf("  5. Folk\n");

    int genre = read_integer_range("Select a genre (1 - 5): ", 1, 5);
    return genre;
}

// }}}

// Read Albums {{{

void read_all_albums() {
    my_string ufile;

    do {
        ufile = read_string("Please enter a valid album file: ");
        afile = fopen (ufile.str, "r");
    } while (afile == NULL);

    fscanf(afile, "%d\n", &album_no);

    for (int i = 0; i < album_no; ++i) {
        fscanf(afile, "%[^\n]\n", albums[i].title);
        fscanf(afile, "%[^\n]\n", albums[i].artist);
        fscanf(afile, "%d\n",     &albums[i].genre);
        fscanf(afile, "%d\n",     &albums[i].tracks);

        for (int j = 0; j < albums[i].tracks; ++j) {
            fscanf(afile, "%[^\n]\n", albums[i].tracklist[j]);
            fscanf(afile, "%[^\n]\n", albums[i].trackpath[j]);
        }
    }

    fclose(afile);
    clear_screen();
    printf("Successfully imported %d albums!\n", album_no);
    printf("Press enter to go back to the menu: ");
    getchar();
}

// }}}

// Write Albums {{{

void write_album(struct Album a) {
    printf("Title: %s\n", a.title);
    printf("Artist: %s\n", a.artist);
    printf("Genre: %s\n", get_genre_name(a.genre));
    printf("Tracks: %d\n", a.tracks);

    for (int i = 0; i < (a.tracks - 1); ++i) {
        printf("Track %d: %s\n", i+1, a.tracklist[i]);
        printf("Path %d: %s\n", i+1, a.trackpath[i]);
    }
}

void write_album_menu(struct Album a) {
    printf("%s - ", a.title);
    printf("%s - ", a.artist);
    printf("%s - ", get_genre_name(a.genre));
    printf("%d Tracks\n", a.tracks);
}

void write_all_albums() {
    clear_screen();

    printf("Imported Albums:\n");
    printf("----------------\n");

    for (int i = 0; i < album_no; ++i) {
        // Check to see if the title is set.
        if (albums[i].title[0]) {
            printf("%d: ", i+1);
            write_album_menu(albums[i]);
        }
    }
    printf("%d: Back to Menu\n", album_no + 1);
}

// }}}

// Select Albums {{{

void select_album() {
    int selection;
    char command[300];

    clear_screen();
    write_all_albums();
    selection = read_integer_range("Select an Album to play: ", 1, album_no+1);
    clear_screen();

    if (selection != (album_no + 1)) {
        // Menu
        printf("> Playing %s by %s, ", albums[selection - 1].tracklist[0], albums[selection - 1].artist);
        printf("from the album: %s\n", albums[selection - 1].title);
        printf("   Q+Enter to stop playback.\n");
        printf("   > to play the next song.\n");
        printf("   < to play the previous song.\n\n");

        strcpy(command, "mpv --no-video --quiet --load-scripts=no --no-config --loop-playlist ");

        // Append tracks to command.
        for (int i = 0; i < albums[selection - 1].tracks; ++i) {
            strcat(command, albums[selection - 1].trackpath[i]);
            strcat(command, " ");
        }

        // Supress errors.
        strcat(command, " 2>/dev/null");

        system(command);
        getchar();
    }
}

// }}}

// Update Albums {{{

void update_album() {
    int selection, field;
    my_string new_title, new_artist;

    write_all_albums();

    selection = read_integer_range("Select an Album to update: ", 1, album_no+1);

    if (selection != (album_no + 1)) {
        clear_screen();

        printf("Update %s information:\n", albums[selection - 1].title);
        printf("1. Update Title\n");
        printf("2. Update Artist\n");
        printf("3. Update Genre\n");
        printf("4. Back to Menu\n");

        field = read_integer_range("Select a field to update: ", 1, 4);

        switch (field) {
            case 1:
                new_title = read_string("Please enter a new Title: ");
                strcpy(albums[selection - 1].title, new_title.str);
                break;
            case 2:
                new_title = read_string("Please enter a new Artist: ");
                strcpy(albums[selection - 1].artist, new_artist.str);
                break;
            case 3:
                albums[selection - 1].genre = read_genre();
                break;
            case 4:
                update_album();
                break;
        }
    }
}

// }}}

// Menus {{{

void main_menu() {
    int selection;

    do {
        printf("Text Based Music Player\n");
        printf("-----------------------\n");
        printf("1. Read in Albums\n");
        printf("2. Display Albums\n");
        printf("3. Select an Album to play\n");
        printf("4. Update an existing Album\n");
        printf("5. Exit the application\n");

        selection = read_integer_range("Select an option (1 - 5): ", 1, 5);

        switch (selection) {
            case 1:
                read_all_albums();
                break;
            case 2:
                write_all_albums();
                getchar();
                break;
            case 3:
                select_album();
                break;
            case 4:
                update_album();
                break;
            case 5:
                break;
        }

        clear_screen();
    } while (selection != 5);
}

// }}}


int main(int argc, char *argv[]) {
    clear_screen();
    main_menu();
    return 0;
}
