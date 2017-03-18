program SimplePolitics;
uses TerminalUserInput;

Const YEAR_TRUMP_ELECTED = 2016;

function calculateAgeWhenTrumpElected(birthYear: Integer): Integer;
begin
     result := YEAR_TRUMP_ELECTED - birthYear;
end;

procedure Main();
var
    name: String;
    yearBorn, ageWhenTrumpElected: Integer;
    isBrexit: Boolean;
begin
    WriteLn('Please enter your name: ');
    ReadLn(name);
    WriteLn('What year were you born?: ');
    ReadLn(yearBorn);

    ageWhenTrumpElected := calculateAgeWhenTrumpElected(yearBorn);

    WriteLn(name, ' you were ', ageWhenTrumpElected, ' years old when Trump was elected.');

    isBrexit := ReadBoolean('Are you a BREXIT supporter? ');

    if isBrexit then
        WriteLN(name, ' is a BREXIT supporter!')
    else
        WriteLN(name, ' is NOT a BREXIT supporter!');

    WriteLn('Press Enter to Continue');
    ReadLn();
end;

begin
    Main();
end.

