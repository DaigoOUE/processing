void setup() {
  size(500, 500, P2D);
  background(0);
  blendMode(ADD);
  colorMode(HSB, 255);
  noLoop();
  for (int i = 0; i < x.length; ++i) { 
    x[i] = random(0, width);
    y[i] = random(0, height);
    c[i] = color(random(120, 170), 255, 255, 51);
  }
}

float[] x = new float[500];
float[] y = new float[x.length];

color[] c = new color[x.length];

void draw() {
  background(0);
  noStroke();
  for (int i = 0; i < x.length; ++i) {
    fill(c[i]);
    float rand = random(10, 100);
    ellipse(x[i], y[i], rand, rand);
  }
}

void mousePressed() {
  redraw();
}

