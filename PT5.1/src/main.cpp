#include <stdio.h>
#include "SwinGame.h"

#define CIRCLE_RADIUS 90

int main()
{
    int x = 400;
    int y = 300;

    open_graphics_window("Character Moving", 800, 600);

    do {
        process_events();

        if (key_down(LEFT_KEY) && (x - CIRCLE_RADIUS != 0)) {
            x -= 5;
        }
        else if (key_down(RIGHT_KEY) && (x + CIRCLE_RADIUS < screen_width())) {
            x += 5;
        }
        else if (key_down(UP_KEY) && (y - CIRCLE_RADIUS != 0)) {
            y -= 5;
        }
        else if (key_down(DOWN_KEY) && (y + CIRCLE_RADIUS < screen_height())) {
            y += 5;
        }

        clear_screen(ColorWhite);
        fill_circle(ColorGreen, x, y, CIRCLE_RADIUS);
        refresh_screen(60);

    } while(! window_close_requested());

    return 0;
}

