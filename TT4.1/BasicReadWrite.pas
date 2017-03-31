program BasicReadWrite;

procedure PrintArray(count: Integer; input: Array of String);
var
    i: Integer;
begin
    i := 0;
    while i < count do
    begin
        WriteLn(input[i]);
        i += 1;
    end;
end;

procedure Main();
var
    myFile: TextFile;
    i, numberOfLines: Integer;
    lineArray: array [0..10] of String;
begin
    WriteLn('The file contained:');

    AssignFile(myFile, 'mytestfile.dat');
    reset(myFile);
    ReadLn(myFile, numberOfLines);

    i := 0;
    while i < numberOfLines do
    begin
        ReadLn(myFile, lineArray[i]);
        i += 1;
    end;
    CloseFile(myFile);

    PrintArray(numberOfLines, lineArray);

    WriteLn('Press Enter to continue.');
    ReadLn();
end;

begin
    Main();
end.

