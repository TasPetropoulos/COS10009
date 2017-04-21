program UsingEnumerations;
uses TerminalUserInput;

type
    Genres = (Pop, Classic, Rock);
    Album = record
        artist, title: String;
        genre: Genres;
    end;

procedure Main();
var
    selection: Integer;
    a: Album;
begin
    selection := ReadIntegerRange('Select a genre (1 - 3): ', 1, 3);
    // Now you need to tell the compiler that you want to treat this
    // integer as a thing of type Genre (not of type integer) so you
    // need to 'cast' it to the Genre type:

    // Also enumerations start at 0 - we asked above for a number from 1 - 3
    // so we need to subtract 1.
    a.genre := Genres(selection -1);

    Writeln(' You selected: ', a.genre);
end;

begin
    Main();
end.
