program UsingEnumerations;
uses TerminalUserInput;

type
    Genres = (Pop, Classic, Rock);
    Album = record
        artist, title: String;
        genre: Genres;
    end;

function ReadGenre(prompt: String): Genres;
var
    selection: Integer;
begin
    WriteLn('Genres:');
    WriteLn('  1. Pop');
    WriteLn('  2. Classic');
    WriteLn('  3. Rock');

    selection := ReadIntegerRange('Select a genre (1 - 3): ', 1, 3);
    result := Genres(selection - 1);
end;

function ReadAlbum(): Album;
begin
    result.artist := ReadString('Enter Artist: ');
    result.title  := ReadString('Enter Title: ');
    result.genre  := ReadGenre('Enter Genre: ');
end;

procedure WriteAlbum(a: Album);
begin
    WriteLn('Artist: ', a.artist);
    WriteLn('Title: ', a.title);
    WriteLn('Genre: ', a.genre);
end;

procedure Main();
var
    selection: Integer;
    a: Album;
begin
    a := ReadAlbum();
    WriteAlbum(a);
end;

begin
    Main();
end.
