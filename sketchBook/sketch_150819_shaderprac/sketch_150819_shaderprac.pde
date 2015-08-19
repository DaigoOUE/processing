PShader sd;

float times = 0;

void setup() {
  size(500, 500);
  sd = loadShader("FragmentShader.glsl");
}

void draw() {
  sd.set("size", width, height);
  sd.set("times", times);
  sd.set("mouseX", mouseX);
  sd.set("mouseY", mouseY);

  shader(sd);

  rect(0, 0, width, height);

  times += 1.0;
}