#include <stdio.h>
#include <string.h>
#include "terminal_user_input.h"

enum genres {Rock, Pop, Jazz, Rap, Folk} genres;

struct Album {
    my_string title;
    my_string artist;
    enum genres genre;
    int tracks;
    my_string tracklist[20];
    my_string trackpath[20];
} album;

struct Album albums[20];


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

enum genres read_genre() {
    int selection;

    printf("Genres:\n");
    printf("  1. Rock\n");
    printf("  2. Pop\n");
    printf("  3. Jazz\n");
    printf("  4. Rap\n");
    printf("  5. Folk\n");
    selection = read_integer_range("Select a genre (1 - 5): ", 1, 5);

    return selection;
}

// }}}

// Read Albums {{{

void read_all_albums(struct Album albums[20]) {
    my_string ufile;
    FILE *afile;
    int album_no;

    do {
        ufile = read_string("Please enter a valid album file: ");
        afile = fopen (ufile.str, "r");
    } while (afile == NULL);

    fscanf(afile, "%d\n", &album_no);
    printf("%d\n", album_no);

    for (int i = 0; i < album_no; ++i) {
        fscanf(afile, "%[^\n]s\n", albums[i].title.str);
        fscanf(afile, "%[^\n]s\n", albums[i].artist.str);
        fscanf(afile, "%[^\n]s\n", albums[i].genre);
        fscanf(afile, "%d\n", albums[i].tracks);

        for (int j = 0;j < (albums[i].tracks - 1); ++j) {
            fscanf(afile, "%[^\n]s\n", albums[i].tracklist[j].str);
            fscanf(afile, "%[^\n]s\n", albums[i].trackpath[j].str);
        }
    }

    printf("%s\n", albums[0].title.str);
    printf("%s\n", albums[1].title.str);
    getchar();
}

// }}}

// Write Albums {{{

void write_album_menu(struct Album a) {
    printf("%s - %s - %s - %d Tracks\n", a.title.str, a.artist.str, a.genre, a.tracks);
}

void write_album(struct Album a) {
    printf("Title: %s", a.title.str);
    printf("Artist: %s", a.artist.str);
    printf("Genre: %s", a.genre);
    printf("Tracks: %d", a.tracks);

    for (int i = 0; i < (a.tracks - 1); ++i) {
        printf("Track %d: %s", i+1, a.tracklist[i].str);
        printf("Path %d: %s", i+1, a.trackpath[i].str);
    }
}

void write_all_albums(struct Album albums[20]) {
    clear_screen();

    printf("Imported Albums:\n");
    printf("----------------\n");

    /* for i := 0 to (Length(albums) - 1) do */
    /* for (int i = 0; i < count; ++i) { */
    /*     printf("%d: ", i+1); */
    /*     /1* write_album_menu(albums[i]); *1/ */
    /* } */
    printf("%s\n", albums[0].artist.str);
    getchar();
}

// }}}


// Menus {{{

void main_menu() {
    struct Album albums[20];
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
                read_all_albums(albums);
                break;
            case 2:
                write_all_albums(albums);
                break;
            case 3:
                /* SelectAlbum(Albums); */
                break;
            case 4:
                /* UpdateAlbum(Albums); */
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
