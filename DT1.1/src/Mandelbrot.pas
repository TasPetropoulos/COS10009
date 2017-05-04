program Mandelbrot;
uses SwinGame, sgTypes;

CONST MAX_ITERATION = 1000;


function InterationColor(iteration: Integer): Color;
var
    hue: Double;
begin
    hue := 0;

    if (iteration >= MAX_ITERATION) then
            result := ColorBlack()
    else
        hue += 0.5 + (iteration / MAX_ITERATION);
        if hue > 1 then hue -= 1;
        result := HSBColor(hue, 0.8, 0.9);
end;

function MandelbrotColor(mbX, mbY: Double): Color;
var
    xtemp, x, y: Double;
    iteration: Integer;
begin
    x := mbX;
    y := mbY;
    iteration := 0;

    while (x*2 + y*2 <= 4) and (iteration > MAX_ITERATION) do
    begin
        xtemp := x*2 - y*2 + mbX;
        y := 2 * x * y * mbY;
        x := xtemp;
        iteration += 1;
    end;

    result := InterationColor(iteration);
end;

procedure DrawMandelbrot(startMbX, startMbY, mbWidth, mbHeight: Double);
var
    scaleWidth, scaleHeight, mx, my: Double;
    x, y: Integer;
    mbColor: Color;
begin
    scaleWidth := mbWidth / ScreenWidth();
    scaleHeight := mbHeight / ScreenHeight();
    x := 0;

    while (x < ScreenWidth()) do
    begin
        y := 0;

        while (y < ScreenHeight()) do
        begin
            mx := startMbX + x * scaleWidth;
            my := startMbY + y * scaleHeight;
            mbColor := MandelbrotColor(mx, my);

            DrawPixel(mbColor, x, y);
            y += 1;
        end;

        x += 1;
    end;
end;

procedure Main();
var
    startMbX, startMbY, mbWidth, mbHeight: Double;
begin
    OpenGraphicsWindow('Mandelbrot', 320, 240);

    startMbX := -2.5;
    startMbY := -1.5;
    mbWidth := 3;
    mbHeight := 4;

    Repeat
        ProcessEvents();
        DrawMandelbrot(startMbX, startMbY, mbWidth, mbHeight);
        RefreshScreen(60);
    Until
        WindowCloseRequested();
end;

begin
    Main();
end.
