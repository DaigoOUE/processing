void setup() {
  size(500, 500);
  colorMode(HSB, 100);
}
int t = 0;
void draw() {
  background(0);
  noStroke();
  fill(100*(radians(t)%TWO_PI)/TWO_PI, 99, 99, 50*(1-cos(radians(20*t))));
  textSize(24);
  text("Let's Processing!", width/2-width/5.2, height/2+height/75);
  for (int k = 0; k < 10; ++k) { 
    for (int j = 0; j < 10; ++j) {
      if ((k < 4||k > 5)||(j < 3||j > 6)) {
        for (int i = 0; i < 40; ++i) {
          noStroke();
          fill((t+i*2+j*10+k*20)%100, 99, 99, 50);
          ellipse(width/20+width/10*j, height/20+height/10*k, width/10-i*width/400, height/10-i*height/400);
        }
      }
    }
  }
  ++t;
}

