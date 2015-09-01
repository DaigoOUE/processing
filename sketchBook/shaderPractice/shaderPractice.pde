PShader sd;
float times = 0;

float r1 = 0;
float r2 = 0;
float r3 = 0;

void setup() {
  size(600, 600, P2D);
  sd = loadShader("FragmentShader.glsl");
  sd.set("size", width, height);
  generate();
}

void draw() {
  sd.set("mouseX", mouseX);
  sd.set("mouseY", mouseY);
  sd.set("times", times);
  sd.set("r1", r1);
  sd.set("r2", r2);
  sd.set("r3", r3);
  shader(sd);  
  times += 3.0;
  rect(0, 0, width, height);
}

void generate() {
  r1 = random(4)-2;
  r2 = random(4)-2;
  r3 = random(4)-2;
}

void mousePressed() {
  generate();
}