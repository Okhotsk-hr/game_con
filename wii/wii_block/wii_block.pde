Wiimote wiimote;

//基準点
float basex = 0;
float basey = 0;

//ラケット変数
int r_px = 0;
int r_py = 0;
int r_dx = 10;
int r_dy = 10;

//ボール変数
int b_px = 0;
int b_py = 0;
int b_dx = 3;
int b_dy = 3;

//ブロック
int blockW = 60;
int blockH = 20;
int blockGapX = 10; // 横の隙間
int blockGapY = 8;  // 縦の隙間
int blockMarginX = 20;
int blockMarginY = 20;
int cols;
int rows;
boolean[][] blocks;

void setup() {
    size(640, 360, P3D);
    noStroke();
    fill(204);
    wiimote = new Wiimote(this);
    r_px = width / 2;
    r_py = height / 2;
    b_px = width / 2;
    b_py = height / 2;
    
    // 画面サイズに合わせてブロック数を自動計算
    cols = (width - blockMarginX * 2 + blockGapX) / (blockW + blockGapX);
    rows = ((height / 2) - blockMarginY + blockGapY) / (blockH + blockGapY);
    blocks = new boolean[cols][rows];
    initBlocks();
}


void draw() {
    background(255);
    
    wiimote.update();
    fill(0);
    
    
    drawBlocks();
    
    // ゲームクリア・オーバー判定用フラグ
    boolean allCleared = true;
    boolean hitBlock = false;
    
    // ボールとブロックの当たり判定
    for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
            if (blocks[i][j]) {
                // ブロックの座標（隙間考慮）
                int bx = i * (blockW + blockGapX) + blockMarginX;
                int by = j * (blockH + blockGapY) + blockMarginY;
                int bw = blockW;
                int bh = blockH;
                // ボールがブロックに当たったか
                if (b_px + 10 > bx && b_px - 10 < bx + bw && b_py + 10 > by && b_py - 10 < by + bh) {
                    blocks[i][j] = false;
                    b_dy *= -1;
                    hitBlock = true;
                } else {
                    allCleared = false;
                }
            }
        }
    }
    
    //ボール表示
    ellipse(b_px, b_py, 20, 20);
    b_px += b_dx;
    b_py += b_dy;
    
    if (b_px <= 0 || b_px >= width) {
        b_dx *= -1;
    }
    if (b_py <= 0) {
        b_dy *= -1;
    }
    
    // ゲームオーバー判定
    if (b_py >= height) {
        textSize(48);
        fill(255,0,0);
        textAlign(CENTER, CENTER);
        text("GAME OVER", width / 2, height / 2);
        noLoop();
        return;
    }
    
    // ゲームクリア判定
    if (allCleared) {
        textSize(48);
        fill(0,128,255);
        textAlign(CENTER, CENTER);
        text("CLEAR!", width / 2, height / 2);
        noLoop();
        return;
    }
    
    //リモコン検知
    if (wiimote.up.pressed) {
        r_px -= r_dx;
    } 
    if (wiimote.down.pressed) {
        r_px += r_dx;
    } 
    
    if (wiimote.right.pressed) {
        r_py -= r_dy;
    } 
    if (wiimote.left.pressed) {
        r_py += r_dy;
    } 
    if (r_px <=  0) {
        r_px = 0;
    }
    if (r_px >=  width - 100) {
        r_px = width - 100;
    }
    if (r_py >=  height - 20) {
        r_py = height - 20;
    }
    if (r_py <=  height - 100) {
        r_py = height - 100;
    }
    
    rect(r_px, r_py, 100, 20);
    
    //ラケットの跳ね返り
    if (b_py >=  r_py && b_px >=  r_px && b_px <=  r_px + 100) {
        b_dy *= -1;
    }
    
    // wiimote.update();
    // // 各ボタンの状態をprint
    // if (wiimote.one.pressed) println("ONE pressed");
    // if (wiimote.two.pressed) println("TWO pressed");
    // if (wiimote.a.pressed) println("A pressed");
    // if (wiimote.b.pressed) println("B pressed");
    // if (wiimote.plus.pressed) println("PLUS pressed");
    // if (wiimote.minus.pressed) println("MINUS pressed");
    // if (wiimote.home.pressed) println("HOME pressed");
    // if (wiimote.up.pressed) println("UP pressed");
    // if (wiimote.down.pressed) println("DOWN pressed");
    // if (wiimote.left.pressed) println("LEFT pressed");
    // if (wiimote.right.pressed) println("RIGHT pressed");
    // // 角度の取得と表示
    // println("x: " + wiimote.x + ", y: " + wiimote.y + ", z: " + wiimote.z);
    // noStroke(); 
    // background(0);
    // if (!wiimote.a.pressed) {
    //     return;
// }
    // directionalLight(204, 204, 204, wiimote.x, wiimote.y, -1); 
    // translate(width / 2 - 100, height / 2, 0); 
    // sphere(80); 
    // translate(200, 0, 0); 
    // sphere(80); 
}

