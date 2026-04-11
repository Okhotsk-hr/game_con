Wiimote wiimote;
void setup() {
    size(640, 360, P3D);
    noStroke();
    fill(204);
    wiimote = new Wiimote(this);
}

void draw() {
    wiimote.update();
    // 各ボタンの状態をprint
    if (wiimote.one.pressed) println("ONE pressed");
    if (wiimote.two.pressed) println("TWO pressed");
    if (wiimote.a.pressed) println("A pressed");
    if (wiimote.b.pressed) println("B pressed");
    if (wiimote.plus.pressed) println("PLUS pressed");
    if (wiimote.minus.pressed) println("MINUS pressed");
    if (wiimote.home.pressed) println("HOME pressed");
    if (wiimote.up.pressed) println("UP pressed");
    if (wiimote.down.pressed) println("DOWN pressed");
    if (wiimote.left.pressed) println("LEFT pressed");
    if (wiimote.right.pressed) println("RIGHT pressed");
    // 角度の取得と表示
    println("x: " + wiimote.x + ", y: " + wiimote.y + ", z: " + wiimote.z);
    noStroke(); 
    background(0);
    if (!wiimote.a.pressed) {
        return;
    }
    directionalLight(204, 204, 204, wiimote.x, wiimote.y, -1); 
    translate(width / 2 - 100, height / 2, 0); 
    sphere(80); 
    translate(200, 0, 0); 
    sphere(80); 
}

