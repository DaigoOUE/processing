void setup() {
  size(500, 500, P3D);
  colorMode(HSB);
  smooth();
  for (int i = 0; i < arm.length; ++i) {
    arm[i] = new Arm(50, random(-PI/6, PI/6), 255*i/arm.length);
  }
}

Arm arm[] = new Arm[5];

float time = 0;
void draw() {
  background(0);
  translate(width/2, height/2);
  pushMatrix();
  for (int i = 0; i < arm.length; ++i) {
    arm[i].display();
    arm[i].move();
  }
  popMatrix();
  ++time;
}

class Arm {
  float[] sp = new float[2];
  float[] ep = new float[2];
  float distance;
  float theta;
  float hue;
  float deltaTheta = random(0, TWO_PI/360);
  Arm(float d, float arg, float h) {
    sp[0] = 0;
    sp[1] = 0;
    distance = d;
    theta = arg;
    ep[0] = d*cos(theta);
    ep[1] = d*sin(theta);
    hue = h;
  }
  void move() {
    if (theta > PI/6||theta < -PI/6) {
      deltaTheta = -deltaTheta;
    }
    theta += deltaTheta*(255-hue)/255;
    ep[0] = distance*cos(theta);
    ep[1] = distance*sin(theta);
  }
  void display() {
    noStroke();
    fill(hue, 255, 255, 127);
    sphere(5);
    stroke(hue, 255, 255, 127);
    strokeWeight(5);
    line(sp[0], sp[1], ep[0], ep[1]);
    rotateZ(theta);
    translate(distance, 0);
    noStroke();
    fill(hue, 255, 255, 127);
    sphere(7);
  }
}

