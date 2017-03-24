program Gamemain;
uses SwinGame, sgTypes;

function ButtonClicked(ButtonX, ButtonY: Single; ButtonWidth, ButtonHeight: Integer): Boolean;
var
    CursorX, CursorY, ButtonEndX, ButtonEndY: Single;
begin
    CursorX := MouseX();
    CursorY := MouseY();
    ButtonEndX := ButtonX + ButtonWidth;
    ButtonEndY := ButtonY + ButtonHeight;

    result := false;

    // You like jazz?
    if MouseClicked(LeftButton) and
       (CursorX >= ButtonX) and
       (CursorX <= ButtonEndX) and
       (CursorY >= ButtonY) and
       (CursorY <= ButtonEndY) then
        result := true;

end;

Procedure main();
var
    bgColor: Color;
begin
    OpenGraphicsWindow('Test Program for Button Click Code', 800, 600);

    // This is ugly af fam.
    // ShowSwinGameSplashScreen();

    bgColor := ColorWhite;

    repeat ClearScreen(bgColor);
    DrawFramerate(0,0);

    FillRectangle(ColorGrey, 50, 50, 100, 30);
    DrawText('Click Me', ColorBlack, 'arial.ttf', 14, 55, 55);
    Refreshscreen();
    ProcessEvents();

    if ButtonClicked(50, 50, 100, 30) then
        bgColor := RandomRGBColor(255);

    until WindowCloseRequested();
end;

begin
    main();
end.
