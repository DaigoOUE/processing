void setup() {
  size(640, 480);
  background(0);
}

int mode = 0;
float[][] lattice = new float[640][480];

void draw() {
  background(0);
  if (mode == 0) {
    valueSet();
  } else if (mode == 1) {
    display();
  }
}

void valueSet() {
  if (mousePressed) {
    float x = sqrt(pow(mouseX-pmouseX, 2)+pow(mouseY-pmouseY, 2));
    lattice[(int)mouseX][(int)mouseY] = x;
    println(mouseX+","+mouseY+","+x);
  }
}

void display() {
  for (int i = 0; i < 640; ++i) {
    for (int j = 0; j < 480; ++j) {
      noStroke();
      fill(255);
      ellipse(i, j, lattice[i][j], lattice[i][j]);
    }
  }
}

void reset() {
  for (int i = 0; i < 640; ++i) {
    for (int j = 0; j < 480; ++j) {
      lattice[i][j] = 0;
    }
  }
}

void keyPressed() {
  if (key == '1') {
    mode = 1;
  } else if (key == ' ') {
    reset();
    mode = 0;
  } else {
    mode = 0;
  }
}

