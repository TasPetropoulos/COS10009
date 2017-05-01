program MusicPlayer;
uses TerminalUserInput, Sysutils, Crt;

type
    Genres = (Rock, Pop, Jazz, Rap, Folk);

    Album = record
        artist, title: String;
        genre: Genres;
        tracklist, trackpath: array of String;
        tracks: Integer;
    end;

    Albums = Array of Album;

// Print Array {{{

function PrintArray(var Arr: Array of String): String;
var
    i: Integer;
begin
    result := '';
    for i := 0 to (length(Arr) - 1) do
    begin
        result += Arr[i];
        result += ' '
    end;
end;

// }}}

// Genres {{{

function ReadGenre(prompt: String): Genres;
var
    selection: Integer;
begin
    WriteLn('Genres:');
    WriteLn('  1. Rock');
    WriteLn('  2. Pop');
    WriteLn('  3. Jazz');
    WriteLn('  4. Rap');
    WriteLn('  5. Folk');

    selection := ReadIntegerRange('Select a genre (1 - 5): ', 1, 5);
    result := Genres(selection - 1);
end;

// }}}

// Read Albums {{{

procedure ReadAllAlbums(var albums: Albums);
var
    afile: String;
    albumFile: TextFile;
    albumNo, i, j: Integer;
begin
    // Check that  file exists.
    repeat
        afile := ReadString('Please enter a valid album file: ');
    until
        FileExists(afile);

    AssignFile(albumFile, afile);
    Reset(albumFile);

    // Get number of albums.
    ReadLn(albumFile, albumNo);
    SetLength(Albums, albumNo);

    for i := 0 to (albumNo - 1) do
    begin
        ReadLn(albumFile, albums[i].title);
        ReadLn(albumFile, albums[i].artist);
        ReadLn(albumFile, albums[i].genre);
        ReadLn(albumFile, albums[i].tracks);

        SetLength(albums[i].tracklist, albums[i].tracks);
        SetLength(albums[i].trackpath, albums[i].tracks);

        for j := 0 to (albums[i].tracks - 1) do
        begin
            ReadLn(albumFile, albums[i].tracklist[j]);
            ReadLn(albumFile, albums[i].trackpath[j]);
        end;
    end;

    ClrScr;
    WriteLn('Imported music file: ', afile);
    WriteLn('Press enter to go back to the menu.');

    CloseFile(albumFile);
end;

// }}}

// Write Albums {{{

procedure WriteAlbum(Album: Album);
var
    i: Integer;
begin
    WriteLn('Title: ', album.title);
    WriteLn('Artist: ', album.artist);
    WriteLn('Genre: ', album.genre);
    WriteLn('Tracks: ', album.tracks);

    for i := 0 to (album.tracks - 1) do
    begin
        WriteLn('Track ', i+1, ': ', album.tracklist[i]);
        WriteLn('Path ', i+1, ': ', album.trackpath[i]);
    end;
end;

procedure WriteAlbumMenu(Album: Album);
begin
    WriteLn(album.title, ' - ', album.artist, ' - ', album.genre, ' - ', album.tracks, ' Tracks');
end;

procedure WriteAllAlbums(var albums: Albums);
var
    i: Integer;
begin
    ClrScr;

    WriteLn('Imported Albums:');
    WriteLn('----------------');

    for i := 0 to (Length(albums) - 1) do
    begin
        Write(i+1, ': ');
        WriteAlbumMenu(albums[i]);
    end;
end;

// }}}

// Select Albums {{{

procedure SelectAlbum(var albums: Albums);
var
    selection: Integer;
    args, songs: String;
begin
    ClrScr;
    WriteAllAlbums(Albums);

    selection := ReadIntegerRange('Select an Album to play: ', 1, Length(Albums));
    songs := PrintArray(albums[selection - 1].trackpath);

    ClrScr;

    // Play the album.
    WriteLn('> Playing ', albums[selection - 1].title, ' by ', albums[selection - 1].artist);
    WriteLn('Press Q to stop playback.');
    WriteLn('Press > to play the next song.');
    WriteLn('Press < to play the previous song.');

    args := '--no-video --quiet --load-scripts=no --no-config --really-quiet --loop ';
    ExecuteProcess('/bin/mpv', args+songs);

    WriteLn('Press Enter to go back to the menu.');
end;

// }}}

// Update Albums {{{

procedure UpdateAlbum(var albums: Albums);
var
    selection: Integer;
begin
    WriteAllAlbums(Albums);
    selection := ReadIntegerRange('Select an Album to update: ', 1, Length(Albums));

    WriteLn('Update ', albums[selection - 1].title, ' information:');
    WriteLn('------');
    WriteLn('1. Update Title');
    WriteLn('2. Update Artist');
    WriteLn('3. Update Genre');

    case selection of
        1: ;
        2: ;
        3: ;
    end;
end;

// }}}

// Menus {{{

procedure MainMenu();
var
    Albums: Array of Album;
    selection: Integer;
begin
    repeat
        WriteLn('Text Based Music Player');
        WriteLn('-----------------------');

        WriteLn('1. Read in Albums');
        WriteLn('2. Display Albums');
        WriteLn('3. Select an Album to play');
        WriteLn('4. Update an existing Album');
        WriteLn('5. Exit the application');

        selection := ReadIntegerRange('Select an option (1 - 5): ', 1, 5);

        case selection of
            1: ReadAllAlbums(Albums);
            2: WriteAllAlbums(Albums);
            3: SelectAlbum(Albums);
            4: UpdateAlbum(Albums);
            5: Exit;
        end;

        ReadLn();
        ClrScr;
    until selection = 5;
end;

// }}}

// Main {{{

procedure Main();
begin
    ClrScr;
    MainMenu();
end;

begin
    Main();
end.

// }}}
