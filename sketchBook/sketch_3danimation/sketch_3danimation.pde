void setup(){
  size(800,800,P3D);
  colorMode(HSB,100);
}

int t = 0;
void draw(){
  background(0);
  lights();
  noStroke();
  fill(0,99,99);
  translate(width/2,height/2,9);
  rotate(radians(t),0,1,0);
  rotate(radians(t),0,0,1);
  sphere(50);
  fill(20,99,99);
  translate(-100,100,-100);
  rotate(radians(t),1,0,0);
  sphere(50);
  translate(10,100,100);
  fill(40,99,99);
  rotate(radians(t)*3,0,1,10);
  sphere(20);
  translate(50,0,0);
  fill(60,99,99);
  sphere(10);
  t++;
}
