program HelloUserWithFunctions;
uses TerminalUserInput;

procedure Main();
var
    name: String;
    age, year, yearBorn: Integer;
begin
    name := ReadString('Please enter your name: ');
    age := ReadInteger('How old are you this year?: ');
    year := ReadInteger('What year is it?: ');

    yearBorn := year - age;

    WriteLN('Hello ', name, ', you were born in ', yearBorn, '.');
    WriteLN('Press enter to continue.');
    ReadLN();
end;

begin
    Main();
end.
