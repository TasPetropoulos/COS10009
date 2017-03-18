unit TerminalUserInput;

interface

///
/// Displays a prompt to the user, and reads in the string
/// they reply with. The string entered is then returned.
///
function ReadString(prompt: String): String;

///
/// Displays a prompt to the user, and reads in the number (whole)
/// they reply with. The function ensures that the user's entry
/// is a valid Integer. The Integer entered is then returned.
///
function ReadInteger(prompt: String): Integer;

///
/// Displays a prompt to the user, and reads in the number (real)
/// they reply with. The function ensures that the user's entry
/// is a valid Double. The Double entered is then returned.
///
function ReadDouble(prompt: String): Double;

/// Displays a prompt to the user then Reads in 'yes' or 'no' and returns true if 'Yes'
/// or false if 'no'
/// Prompts again if 'yes' or 'no' not entered.

function ReadBoolean(prompt: String): Boolean;

implementation
uses SysUtils;

function ReadString(prompt: String): String;
begin
	Write(prompt);
	ReadLn(result);
end;

function ReadInteger(prompt: String): Integer;
var
	line: String;
begin
	line := ReadString(prompt);
	while not TryStrToInt(line, result) do
	begin
		WriteLn(line, ' is not an integer.');
		line := ReadString(prompt);
	end;
end;

function ReadDouble(prompt: String): Double;
var
	line: String;
begin
	line := ReadString(prompt);
	while not TryStrToFloat(line, result) do
	begin
		WriteLn(line, ' is not a double.');
		line := ReadString(prompt);
	end;
end;

function ReadBoolean(prompt: String): Boolean;
var
	line: String;
begin
	line := LowerCase(ReadString(prompt));

	// Just accept 'yes' or 'no' for now - you will need to extend this later

	while not ((line = 'yes') or (line = 'no')) do
	begin
		WriteLn(line, ' Please enter ''yes'' or ''no'': ');
		line := LowerCase(ReadString(prompt));
	end;
	if (line = 'yes') then
		result := true
	else
		result := false;
end;

end.
