program MusicPlayer;
uses TerminalUserInput;

type
    Genres = (Rock, Pop, Jazz, Rap, Folk);
    Album = record
        artist, title: String;
        genre: Genres;
        tracklist, trackpath: array of String;
    end;

procedure Main();
var
    a: Album;
    i: Integer;
    selection: Integer;
begin
    // Title
    a.title := ReadString('Please input an Album Name: ');

    // Genres
    WriteLn('Genres:');
    WriteLn('  1. Rock');
    WriteLn('  2. Pop');
    WriteLn('  3. Jazz');
    WriteLn('  4. Rap');
    WriteLn('  5. Folk');

    selection := ReadIntegerRange('Select a genre (1 - 5): ', 1, 5);
    a.genre := Genres(selection - 1);
    WriteLn('You selected ', a.genre);

    // Track List
    selection := ReadIntegerRange('Select a number of tracks (max 20): ', 1, 20);
    SetLength(a.tracklist, selection);
    SetLength(a.trackpath, selection);

    for i := 1 to selection do
    begin
        Write('Enter a track name for track ', i, ': ');
        ReadLn(a.tracklist[i]);

        Write('Enter a file path for track ', i, ': ');
        ReadLn(a.trackpath[i]);
    end;

    // Print Info
    WriteLn('Album: ', a.title);
    WriteLn('Genre: ', a.genre);
    WriteLn();
    WriteLn('Select a track:');

    // Print Tracks
    for i := 1 to selection do
    begin
        WriteLn('  ', i, '. ', a.tracklist[i]);
    end;

    // Select Track
    selection := ReadIntegerRange('Select a track to play: ', 1, selection);

    // Print Now Playing
    Write(a.tracklist[selection]);
    Write(', from the album ', a.title);
    WriteLn(', is now playing from ', a.trackpath[selection]);

    ReadLn();
end;

begin
    Main();
end.
