program MyTestProgram;
uses SysUtils;

// Put your record definition here
type
    Airplane = record
        id, kms: Integer;
        manufacturer, model: String;
    end;

type
    Airplanes = Array of Airplane;

// Put your array type definition here

// Helper Functions {{{
function ReadString(prompt: String): String;
begin
    Write(prompt);
    ReadLn(result);
end;

function ReadInteger(prompt: String): Integer;
begin
    while not TryStrToInt(ReadString(prompt), result) do
    begin
        WriteLn('Please enter a whole number.');
    end;
end;

function ReadDouble(prompt: String): Double;
begin
    while not TryStrToFloat(ReadString(prompt), result) do
    begin
        WriteLn('Please enter a floating point number.');
    end;
end;

// }}}

// Put your functions and procedures below here
function ReadAirplane(): Airplane;
begin
    result.id           := ReadInteger('Enter Airplane ID: ');
    result.manufacturer := ReadString('Enter Airplane Manufacturer: ');
    result.model        := ReadString('Enter Airplane Model: ');
    result.kms          := ReadInteger('Enter Airplane KMs Flown: ');
end;

procedure WriteAirplane(a: Airplane);
begin
    WriteLn('Airplane ID: ', a.id);
    WriteLn('Airplane Manufacturer: ', a.manufacturer);
    WriteLn('Airplane Model: ', a.model);
    WriteLn('Airplane KMs Flown: ', a.kms);
end;

function ReadAllAirplanes(count: Integer): Airplanes;
var
    i: Integer;
begin
    SetLength(result, count);

    for i := 0 to (count - 1) do
    begin
        result[i] := ReadAirplane();
    end;
end;

procedure WriteAllAirplanes(airplaneArray: Airplanes);
var
    i: Integer;
begin
    for i := 0 to (Length(airplaneArray) - 1) do
    begin
        WriteAirplane(airplaneArray[i]);
    end;
end;

function IndexOfAirplaneWithID(id: Integer; airplaneArray: Airplanes): Integer;
var
    i: Integer;
begin
    for i := 0 to (Length(airplaneArray) - 1) do
    begin
        if (airplaneArray[i].id = id) then
            result := i;
    end;
end;

// Remember: SetLength(array, count) and Length(array)
// If using floating point numbers remember Writeln(x:0:2) to format output

// Complete the following Main() according to your Test Specification

procedure Main();
var
    Airplanes: Array of Airplane;
    index: integer;
begin
    Airplanes := ReadAllAirplanes(3);
    WriteAllAirplanes(Airplanes);

    // Credit Task
    index := IndexOfAirplaneWithID(103, Airplanes);
    WriteLn('Index is ', index);
    if (index <> -1) then
        WriteAirplane(Airplanes[index]);
end;

begin
    Main();
end.
