program MusicPlayer;
uses TerminalUserInput;

type
    Genres = (Rock, Pop, Jazz, Rap, Folk);
    Album = record
        artist, title: String;
        genre: Genres;
        tracklist, trackpath: array of String;
    end;

// Functions {{{

function ReadAlbum(): String;
begin
    result := ReadString('Please input an Album Name: ')
end;

function ReadGenre(): Genres;
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
    WriteLn('You selected ', result);
end;

function ReadTrack(trackNo: Integer): String;
begin
    WriteLn('Enter a track name for track ', trackNo);
    result := ReadString('');
end;

function ReadPath(trackNo: Integer): String;
begin
    WriteLn('Enter a file path for track ', trackNo);
    result := ReadString('');
end;

// }}}

// Procedures {{{

procedure PrintInfo(a: Album; selection: Integer);
var
    i: Integer;
begin
    WriteLn('Album: ', a.title);
    WriteLn('Genre: ', a.genre);
    WriteLn();
    WriteLn('Select a track:');

    for i := 1 to selection do
    begin
        WriteLn('  ', i, '. ', a.tracklist[i]);
    end;
end;

procedure PlayTrack(a: Album);
var
    selection: Integer;
begin
    // Select Track
    selection := ReadIntegerRange('Select a track to play: ', 1, selection);

    // Print Now Playing
    Write(a.tracklist[selection]);
    Write(', from the album ', a.title);
    WriteLn(', is now playing from ', a.trackpath[selection]);
end;

// }}}


procedure Main();
var
    a: Album;
    i: Integer;
    selection: Integer;
begin
    a.title := ReadAlbum();
    a.genre := ReadGenre();

    // Track List
    selection := ReadIntegerRange('Select a number of tracks (max 20): ', 1, 20);
    SetLength(a.tracklist, selection);
    SetLength(a.trackpath, selection);

    for i := 1 to selection do
    begin
        a.tracklist[i] := ReadTrack(i);
        a.trackpath[i] := ReadPath(i);
    end;

    // Print Info
    PrintInfo(a, selection);
    PlayTrack(a);

    ReadLn();
end;

begin
    Main();
end.
