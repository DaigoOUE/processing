void setup() {
  size(500, 500);
  colorMode(RGB, 255);
  strokeWeight(1);
  for (int i = 0; i < circle.length; ++i) {
    circle[i] = new Circle();
  }
}

int t = 0;
int s = 1;

Circle[] circle = new Circle[100];

void draw() {
  background(255);
  back();
  for (int i = 0; i < circle.length; ++i) {
    circle[i].move();
    circle[i].display();
  }
  t += s;
}

void back() {
  float r1, g1, b1;
  r1 = 157;
  g1 = 41;
  b1 = 50;
  float r2, g2, b2;
  r2 = 167;
  g2 = 189;
  b2 = 0;
  float dr, dg, db;
  dr = r2-r1;
  dg = g2-g1;
  db = b2-b1;
  for (int i = 0; i < 500; ++i) {
    float r = map(i, 0, 500, 0, dr);
    float g = map(i, 0, 500, 0, dg);
    float b = map(i, 0, 500, 0, db);
    stroke(r1 + r, g1 + g, b1 + b);
    line(i, 0, i, height);
  }
}

class Circle {
  float[] x = new float[2];
  float[] v = new float[2];
  float R, G, B;
  Circle() {
    reset();
  }

  void reset() {
    x[0] = random(0, width);
    x[1] = random(0, height);
    if (x[0]-width/2 < 0) {
      v[0] = -random(1, 10);
    } else {
      v[0] = random(1, 10);
    }
    v[1] = 0;
  }

  void move() {
    x[0] += v[0]*s;
    x[1] += 2*pow(s, 2) + v[1]*s;
    if (x[0] < 0||x[0] > width) {
      v[0] = -v[0];
    }
    if (x[1] > height||x[1] < 0) {
      reset();
    }
  }
  void display() {
    noStroke();

    /*color setting*/
    float r1, g1, b1;
    r1 = 157;
    g1 = 41;
    b1 = 50;
    float r2, g2, b2;
    r2 = 167;
    g2 = 189;
    b2 = 0;
    float dr, dg, db;
    dr = r2-r1;
    dg = g2-g1;
    db = b2-b1;
    R = r1 + map(x[0], 500, 0, 0, dr);
    G = g1 +map(x[0], 500, 0, 0, dg);
    B = b1 +map(x[0], 500, 0, 0, db);
    fill(R, G, B);
    ellipse(x[0], x[1], 20, 20);
  }
}

