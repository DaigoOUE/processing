void setup() {
  size(500, 500, P2D);
  colorMode(HSB);
  noStroke();
}

float t = 0;
float angle = 0;
float a = 200;
void draw() {
  angle = 10*180*(1-cos(radians(t)));
  translate(width/2, height/2);
  background(0);
  beginShape(TRIANGLE);
  fill(255*(angle%360)/360, 255, 255);
  vertex(-a*sqrt(3)/3*sin(radians(angle)), -a*sqrt(3)/3*cos(radians(angle)));
  fill(255*((angle+120)%360)/360, 255, 255);
  vertex(-a/2*cos(radians(angle))+a*sqrt(3)/6*sin(radians(angle)), a/2*sin(radians(angle))+a*sqrt(3)/6*cos(radians(angle)));
  fill(255*((angle+240)%360)/360, 255, 255);
  vertex(a/2*cos(radians(angle))+a*sqrt(3)/6*sin(radians(angle)), -a/2*sin(radians(angle))+a*sqrt(3)/6*cos(radians(angle)));
  endShape();

  t += 1;
}