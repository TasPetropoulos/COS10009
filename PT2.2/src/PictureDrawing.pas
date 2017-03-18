program PictureDrawing;
uses SwinGame, sgTypes;

procedure DrawRoss(x, y: Integer);
begin
    // Head
    FillCircle(ColorBrown, x, y, 100);
    FillCircle(ColorOrange, x, y+75, 50);

    // Beard
    DrawCircle(ColorBrown, x, y+75, 50);
    DrawCircle(ColorBrown, x, y+75, 51);
    DrawCircle(ColorBrown, x, y+75, 52);
    DrawCircle(ColorBrown, x, y+75, 53);
    DrawCircle(ColorBrown, x, y+75, 54);
    DrawCircle(ColorBrown, x, y+75, 55);

    // Ears
    // FillCircle(ColorOrange, 350, y+75, 10);
    // FillCircle(ColorOrange, 450, y+75, 10);

    // Eyebrows
    FillRectangle(ColorBrown, x-30, y+48, 20, 5);
    FillRectangle(ColorBrown, x+10, y+48, 20, 5);

    // Eyes
    FillEllipse(ColorWhite, x-25, y+55, 15, 10);
    FillEllipse(ColorWhite, x+10, y+55, 15, 10);
    FillCircle(ColorBrown, x-18, y+60, 5);
    FillCircle(ColorBrown, x+17, y+60, 5);

    // Mouth
    FillRectangle(ColorWhite, x-18, y+90, 5, 4);
    FillRectangle(ColorWhite, x-12, y+90, 5, 6);
    FillRectangle(ColorWhite, x-6, y+90, 5, 7);
    FillRectangle(ColorWhite, x, y+90, 5, 7);
    FillRectangle(ColorWhite, x+6, y+90, 5, 6);
    FillRectangle(ColorWhite, x+12, y+90, 5, 4);

    // Moustache
    FillRectangle(ColorBrown, x-20, y+85, 40, 6);

    // Nose
    FillEllipse(ColorOrange, x-15, y+57, 30, 30);
    // FillRectangle(ColorRed, x-8, y+65, 1, 10);
    // FillRectangle(ColorRed, x+7, y+65, 1, 10);
end;

procedure Main();
var
    i, j: Integer;
begin
    OpenGraphicsWindow('A R T', 800, 600);
    ClearScreen(ColorMagenta);

    // A E S T H E T I C
    // This is really inefficient, fight me.
    for i := 0 to 50 do
    begin
        j := j + 10;

        DrawCircle(ColorTurquoise, 400, 275, j);
        DrawCircle(ColorTurquoise, 400, 275, j+1);
        DrawCircle(ColorTurquoise, 400, 275, j+2);
        DrawCircle(ColorTurquoise, 400, 275, j+3);
    end;

    // Corners
    DrawRoss(100, 100);
    DrawRoss(700, 100);
    DrawRoss(100, 500);
    DrawRoss(700, 500);

    // Center
    DrawRoss(400, 275);

    RefreshScreen();
    Delay(5000);
end;

begin
    Main();
end.
