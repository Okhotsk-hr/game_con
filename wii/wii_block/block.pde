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
                rect(i * 80 + 20, j * 30 + 20, 60, 20);
            }
        }
    }
}