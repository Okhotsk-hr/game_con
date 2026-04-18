// block functions
void initBlocks() {
    for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
            blocks[i][j] = true;
        }
    }
}

void drawBlocks() {
    for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
            if (blocks[i][j]) {
                int x = i * (blockW + blockGapX) + blockMarginX;
                int y = j * (blockH + blockGapY) + blockMarginY;
                rect(x, y, blockW, blockH);
            }
        }
    }
}