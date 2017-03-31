program CircleMoving;
uses SwinGame, sgTypes;

CONST CIRCLE_RADIUS = 150;

procedure Main();
var
    x, y: Integer;
begin
    OpenGraphicsWindow('Character Moving', 800, 600);

    x := 400;
    y := 300;

    repeat
        ProcessEvents();

        if KeyDown(LeftKey) and (x - CIRCLE_RADIUS <> 0) then
            x -= 5
        else if KeyDown(RightKey) and (x + CIRCLE_RADIUS < ScreenWidth()) then
            x += 5
        else if KeyDown(UpKey) and (y - CIRCLE_RADIUS <> 0) then
            y -= 5
        else if KeyDown(DownKey)  and (y + CIRCLE_RADIUS < ScreenHeight()) then
            y += 5;

        ClearScreen(ColorWhite);
        FillCircle(ColorGreen, x, y, CIRCLE_RADIUS);
        Refreshscreen(60);
    until WindowCloseRequested();
end;

begin
    Main();
end.
