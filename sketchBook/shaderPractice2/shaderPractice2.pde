PShader sd;
float times = 0;

void setup() {
  size(500, 500, P2D);
  sd = loadShader("fragmentshader.glsl");
  sd.set("size", width, height);
}

void draw() {
  sd.set("times",times);
  shader(sd);
  rect(0, 0, width, height);
  times += 1.0;
}