void setup() {
  size(800, 400);
}

Vector vector = new Vector();

void draw() {
  background(0);
  vector.start[0] = pmouseX;
  vector.start[1] = pmouseY;
  vector.end[0] = mouseX;
  vector.end[1] = mouseY;
  vector.display();
}

class Vector {
  float[] start = new float[2];
  float[] end = new float[2];
  void display() {
    noStroke();
    fill(255);
    ellipseMode(CENTER);
    ellipse(start[0], start[1], 10, 10);
    stroke(255);
    line(start[0], start[1], end[0], end[1]);
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(end[0], end[1], 10, 10);
  }
}

