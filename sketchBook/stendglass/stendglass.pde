void setup() {
  size(600, 600, P3D);
  blendMode(ADD);
}

Trigons trigon1 = new Trigons(100);
Trigons trigon2 = new Trigons(150);
Trigons trigon3 = new Trigons(200);

float time = 0;

void draw() {
  background(0);
  noStroke();
  translate(width/2, height/2, 0);
  pushMatrix();
  pushMatrix();
  rotateZ(radians(time)/3);
  trigon1.display();
  popMatrix();
  pushMatrix();
  rotateY(TWO_PI*(mouseX-width/2)/250);
  trigon2.display();
  popMatrix();
  pushMatrix();
  rotateX(-TWO_PI*(mouseY-height/2)/250);
  trigon3.display();
  popMatrix();
  popMatrix();
  ++time;
}

class Trigons {
  float radius;
  float[][][] x = new float[20][20][9];
  float dtheta = random(-PI/6, PI/6);
  float dphi = random(-PI/6, PI/6);
  color[][] c = new color[20][20];
  Trigons(float r) {
    radius = r;
    for (int i = 0; i < 20; ++i) {
      for (int j = 0; j < 20; ++j) {
        for (int k = 0; k < 9; ++k) {
          x[i][j][k] = random(-50, 50);
        }
        c[i][j] = color(255, random(0, 255), random(0, 255), 102);
      }
    }
  } 
  void display() {
    for (int i = 0; i < 20; ++i) {
      for (int j = 0; j < 20; ++j) {
        float theta = TWO_PI*i/20 + dtheta;
        float phi = TWO_PI*j/20+ dphi;
        pushMatrix();
        translate(radius*cos(theta)*sin(phi), radius*sin(theta)*sin(phi), radius*cos(phi));
        fill(c[i][j]);
        beginShape();
        vertex(x[i][j][0], x[i][j][1], x[i][j][2]);
        vertex(x[i][j][3], x[i][j][4], x[i][j][5]);
        vertex(x[i][j][6], x[i][j][7], x[i][j][8]);
        endShape();
        popMatrix();
      }
    }
  }
}