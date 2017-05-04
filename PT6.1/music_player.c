#include <stdio.h>
#include <string.h>
#include "terminal_user_input.h"

enum genres {Rock, Pop, Jazz, Rap, Folk} genres;

struct Album {
   my_string title;
   my_string artist;
   enum genres genre;
   my_string tracklist[20];
   my_string trackpath[20];
} album;

// Music functions {{{

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

my_string read_album() {
    my_string title;
    title = read_string("Please input an Album Name: ");
    return title;
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

my_string read_track(int track_no) {
    my_string track;
    printf("Enter a track name for track %d: ", track_no);
    track = read_string("");
    return track;
}

my_string read_path(int track_no) {
    my_string path;
    printf("Enter a file path for track %d: ", track_no);
    path = read_string("");
    return path;
}

// }}}

int main(int argc, char *argv[]) {
    struct Album a;
    int selection, i;

    a.title = read_album();
    a.genre = read_genre();

    // Tracks
    selection = read_integer_range("Select a number of tracks (max 20): ", 1, 20) + 1;
    for (i = 1; i < selection; ++i) {
        a.tracklist[i] = read_track(i);
        a.trackpath[i] = read_path(i);
    }

    // Print Info
    printf("Album: %s\n", a.title.str);
    printf("Genre: %s\n\n", get_genre_name(a.genre));
    printf("Select a track:\n");

    // Print Tracks
    for (i = 1; i < selection; ++i) {
        printf("%d. %s\n", i, a.tracklist[i].str);
    }
    selection = read_integer_range("Select a track to play: ", 1, selection);

    printf("%s, ", a.tracklist[selection].str);
    printf("from the album %s, ", a.title.str);
    printf("is now playing from %s\n", a.trackpath[selection].str);

    return 0;
}
