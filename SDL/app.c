#include "sim.h"


void drawLine(int x1, int y1, int x2, int y2, int argb) {
    int dx = x2 - x1;
    int dy = y2 - y1;

    if (dx < 0) {
        dx = -dx;
    }
    if (dy < 0) {
        dy = -dy;
    }
    
    int sx = -1;
    int sy = -1;

    if (x1 < x2) {
        sx = 1;
    }
    if (y1 < y2) {
        sy = 1;
    }

    int err = dx - dy;

    simPutPixel(x1, y1, argb);

    while (x1 != x2 || y1 != y2) {
        int e2 = 2 * err;

        if (e2 > -dy) {
            err -= dy;
            x1 += sx;
        }
        if (e2 < dx) {
            err += dx;
            y1 += sy;
        }

        simPutPixel(x1, y1, argb);
    }

    simFlush();
}

void app() {
    int p_x[3] = {0, 255, 510};
    int p_y[3] = {255, 0, 255};
    
    drawLine(p_x[0], p_y[0], p_x[1], p_y[1], 0xFFFFFFFF);
    drawLine(p_x[1], p_y[1], p_x[2], p_y[2], 0xFFFFFFFF);
    drawLine(p_x[2], p_y[2], p_x[0], p_y[0], 0xFFFFFFFF);
    
    int x = p_x[1];
    int y = p_y[1];

    for (int i = 0; i < 5000; ++i) {
        simPutPixel(x, y, 0xFFFFFFFF);

        int dir = simRand() % 3;

        x = (x + p_x[dir]) / 2;
        y = (y + p_y[dir]) / 2;

        simPutPixel(x, y, 0xFFFF0000);
        simFlush();
    }

    drawLine(p_x[0], p_y[0], p_x[1], p_y[1], 0xFF00FF00);
    drawLine(p_x[1], p_y[1], p_x[2], p_y[2], 0xFF00FF00);
    drawLine(p_x[2], p_y[2], p_x[0], p_y[0], 0xFF00FF00);
}
