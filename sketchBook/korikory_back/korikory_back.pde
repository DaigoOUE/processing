void setup() {
  size(500, 500, P2D);
  colorMode(HSB, 255);
  blendMode(ADD);
  background(0);
  for (int i = 0; i < s.length; ++i) {
    s[i] = random(50, 100);
    x[i] = random(-width/3, 4*width/3);
    y[i] = random(-height/3, 4*height/3);
    c[i] = color(random(180, 300)%255, 255, 102);
  }
}

float[] s = new float[200];
float[] x = new float[s.length];
float[] y = new float[s.length];
color[] c = new color[s.length];

void draw() {
  background(0);
  noStroke();
  for (int i = 0; i < s.length; ++i) {
    fill(c[i]);
    pushMatrix();
    translate(-s[i]*(mouseX-width/2)/100, -s[i]*(mouseY-height/2)/100);
    ellipse(x[i], y[i], s[i], s[i]);
    popMatrix();
  }
}

