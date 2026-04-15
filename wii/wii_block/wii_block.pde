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
int cols = 5;
int rows = 3;
boolean[][] blocks = new boolean[cols][rows];

void setup() {
    size(640, 360, P3D);
    noStroke();
    fill(204);
    wiimote = new Wiimote(this);
    r_px = width / 2;
    r_py = height / 2;
    b_px = width / 2;
    b_py = height / 2;
    
    
    initBlocks();
}


void draw() {
    background(255);
    
    wiimote.update();
    fill(0);
    
    drawBlocks();
    
    //ボール表示
    ellipse(b_px, b_py, 20, 20);
    b_px += b_dx;
    b_py += b_dy;
    
    if (b_px <= 0 || b_px >= width) {
        b_dx *= -1;
    }
    if (b_py <= 0 || b_py >= height) {
        b_dy *= -1;
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

