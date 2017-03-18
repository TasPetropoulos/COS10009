program TestUserInput;
uses TerminalUserInput;

procedure Main();
var
	name: String;
	friend: String;
	age: Integer;
	guess: Integer;
	percent: Double;
	again: Boolean;
begin
  WriteLn('Testing read string... the string entered should be saved in name.');
	name := ReadString('Enter name: ');
  WriteLn('Your Name: ', name);
  WriteLn();

  WriteLn('Testing read integer... the number should be saved in age.');
  WriteLn(' - Enter "fred" first. Verify it loops with error');
  WriteLn(' - Enter "ten" next. Verify it loops with error');
  WriteLn(' - Enter "10" and it should work');
	age := ReadInteger('Enter your age: ');
  WriteLn('Age: ', age);
  WriteLn();

  WriteLn('Testing read integer range... the number should be saved in guess.');
  WriteLn(' - Enter "fred" first. Verify it loops with error');
  WriteLn(' - Enter "ten" next. Verify it loops with error');
  WriteLn(' - Enter "600" -- should loop with error');
  WriteLn(' - Enter "6.6" -- should loop with error');
  WriteLn(' - Enter "-6" -- should loop with error');
  WriteLn(' - Enter "6" and it should work');
	// guess := ReadIntegerRange('Enter a number between 1 and 10: ', 1, 10);
  WriteLn('Guess: ', guess);
	WriteLn();

  WriteLn('Testing read double range... the number should be saved in percent.');
  WriteLn(' - Enter "fred" first. Verify it loops with error');
  WriteLn(' - Enter "ten" next. Verify it loops with error');
  WriteLn(' - Enter "600" -- should loop with error');
  WriteLn(' - Enter "-1" -- should loop with error');
  WriteLn(' - Enter "0.5" and it should work');
	// percent := ReadDoubleRange('Enter percent value (0 to 1.0 for 100%): ', 0.0, 1.0);
  WriteLn('Percent: ', percent:4:2);
  WriteLn();


  WriteLn('Testing read boolean... the result is saved in again.');
  WriteLn(' - Enter "fred" first. Verify it loops with error');
  WriteLn(' - Extend these boolean tests... add messages and verify your solution!');
  WriteLn(' - Enter "yes" and it should succeed');
	// again := ReadBoolean('Play again? ');
	WriteLn('Again: ', again);
	WriteLn();
  WriteLn(' - Verify that it can also read in false...');
	// again := ReadBoolean('Play again? ');
	WriteLn('Again: ', again);
  WriteLn();

  WriteLn('Tests complete...');
end;

begin
	Main();
end.
