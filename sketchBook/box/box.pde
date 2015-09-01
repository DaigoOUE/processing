import gifAnimation.*;

GifMaker gifMaker;

void setup() {
  size(500, 500, P3D);
  gifMaker = new GifMaker(this, "box.gif");
  gifMaker.setRepeat(0);
  gifMaker.setDelay(30);
}

int time = 0;
void draw() {
  background(0);
  pointLight(100, 150, 200, 0, 0, 50);
  ambientLight(102, 102, 102);
  directionalLight(205, 205, 205, -1, 2, -2);
  ambient(102,102,102);
  emissive(50, 50, 50);
  translate(width/2, height/2, 0);
  rotate(radians(3*time), sin(radians(time)), cos(radians(time)), 1);
  fill(0, 0, 255);
  box(160);
  ++time;
  gifMaker.addFrame();
  if (radians(time) >= TWO_PI) {
    gifMaker.finish();
    exit();
  }
}

