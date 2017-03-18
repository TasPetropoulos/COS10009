program HelloUser;

procedure Main();
var
    name: String;
    age, year, yearBorn: Integer;
begin
    WriteLN('Please enter your name: ');
    ReadLN(name);

    WriteLN('How old are you this year?: ');
    ReadLN(age);

    WriteLN('What year is it?: ');
    ReadLN(year);

    yearBorn := year - age;

    WriteLN('Hello ', name, ', you were born in ', yearBorn, '.');

    WriteLN('Press enter to continue.');
    ReadLN();
end;

begin
    Main();
end.
