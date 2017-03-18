program NameTester;
uses TerminalUserInput;

procedure OutputSillyName(firstName: string);
var
    i: Integer;
begin
    i := 0;

    Write(firstName, ' is a');

    while i < 60 do
    begin
        Write(' silly');
        i := i + 1;
    end;

    Write(' name!');
    WriteLn();
end;

procedure Main();
var
    firstName: String;
begin
    firstName := ReadString('Please enter your name: ');

    if (lowercase(firstName) = 'dylan') then
        WriteLn(firstName, ' is an awesome name!')
    else if (lowercase(firstName) = 'marcus') then
        WriteLn(firstName, ' is an ok name!')
    else
        // WriteLn(name, ' is a silly name!');
        OutputSillyName(firstName);
end;

begin
    Main();
end.
