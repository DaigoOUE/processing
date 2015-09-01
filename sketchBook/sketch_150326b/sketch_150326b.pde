void setup() {
  size(500, 500, P3D);
  background(0);
}

int time = 0;
void draw() {
  //background(255);
  lights();
  translate(width/2, height/2, 0);
  rotate(radians(time), cos(radians(time)), sin(radians(time)), 0);
  noStroke();
  for (int i = 0; i < 7; ++i) {
    pushMatrix();
    rotateX(radians(6*time)+TWO_PI*i/7);
    translate(200*cos(radians(time)+TWO_PI*i/7), 0, 0);
    fill(510*abs(mouseX-width/2)/width, 510*abs(mouseY-height/2)/height, 0, 90);
    box(20);
    popMatrix();
  }
  for (int i = 0; i < 7; ++i) {
    pushMatrix();
    rotateY(radians(6*time)+TWO_PI*i/7);
    translate(0, 200*cos(radians(time)+TWO_PI*i/7), 0);
    fill(0, 510*abs(mouseX-width/2)/width, 510*abs(mouseY-height/2)/height, 90);
    box(20);
    popMatrix();
  }
  for (int i = 0; i < 7; ++i) {
    pushMatrix();
    rotateZ(radians(6*time)+TWO_PI*i/7);
    translate(0, 0, 200*cos(radians(time)+TWO_PI*i/7));
    fill(510*abs(mouseX-width/2)/width, 0, 510*abs(mouseY-height/2)/height, 90);
    box(20);
    popMatrix();
  }
  //saveFrame("test/####.tiff");
  ++time;
}

