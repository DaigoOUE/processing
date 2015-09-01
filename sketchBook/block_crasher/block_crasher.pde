void setup() {
  size(500, 500, P3D);
  int j = 1;
  for (int i = 0; i < block.length; ++i) {
    int b = (i*50)%500;
    if (b == 0&&i != 0) {
      ++j;
    }
    float[] a = new float[3];
    a[0] = b+25;
    a[1] = j*40;
    a[2] = 0;
    block[i] = new Block(a);
  }
}

Block[] block = new Block[20];
Ball ball = new Ball(100, 400);

int t = 0;
void draw() {
  background(0);
  board();
  directionalLight(102, 102, 102, -1, 2, -1);
  ambientLight(102, 102, 102);
  myCamera();
  for (int i = 0; i < block.length; ++i) {
    block[i].display();
  }
  ball.move();
  ball.display();
  ball.barDisplay();
  for (int i = 0; i < block.length; ++i) {
    interact(ball, block[i]);
  }
  ++t;
}

void board() {
  noStroke();
  fill(255);
  beginShape();
  vertex(0, 0, -10);
  vertex(0, 500, -10);
  vertex(500, 500, -10);
  vertex(500, 0, -10);
  endShape(CLOSE);
  fill(200);
  beginShape();
  vertex(0, 0, -10);
  vertex(0, 0, 10);
  vertex(0, 500, 10);
  vertex(0, 500, -10);
  endShape(CLOSE);
  beginShape();
  vertex(500, 0, -10);
  vertex(500, 0, 10);
  vertex(500, 500, 10);
  vertex(500, 500, -10);
  endShape(CLOSE);
  beginShape();
  vertex(0, 0, -10);
  vertex(0, 0, 10);
  vertex(500, 0, 10);
  vertex(500, 0, -10);
  endShape(CLOSE);
}

void myCamera() {
  if (key == '1') {
    if (ball.v[0] == 0) {
      camera(ball.x[0]-2, ball.x[1]-2, 0, ball.x[0]+mouseX, ball.x[1]+498, 0, 0, 0, 1);
    } else {
      camera(ball.x[0]-30*ball.v[0], ball.x[1]-30*ball.v[1], 0, ball.x[0], ball.x[1], 0, 0, 0, 1);
    }
  } else if (key == '2') {
    camera(mouseX, 700, 0, ball.x[0], ball.x[1], 0, 0, 0, -1);
  } else if (key == '3') {
    camera(width/2, -200, 300, mouseX, 498, 0, 0, 0, 1);
  } else if (key == '4') {
    camera(width/2+100+100*cos(radians(t)), -200, 200+50*sin(radians(t)), ball.x[0], ball.x[1], 0, 0, 0, 1);
  } else {
    camera();
  }
}

void interact(Ball b, Block k) {
  float distance;
  distance = sqrt(pow(b.x[0]-k.x[0], 2) + pow(b.x[1]-k.x[1], 2));
  if (k.d != 0) {
    if (distance < 10 + k.d) {
      b.v[0] = -b.v[0];
      b.v[1] = -b.v[1];
      k.d = 0;
    }
  }
}

class Ball {
  float[] x = new float[3];
  float[] v = new float[3];
  Ball(float a, float b) {
    x[0] = a;
    x[1] = b;
    x[2] = 0;
    v[0] = 2;
    v[1] = 2;
  }
  void move() {
    x[0] += v[0];
    x[1] += v[1];
    if (x[1] < 0) {
      v[1] = -v[1];
    }
    if (x[1] > height-5) {
      if (x[0]<mouseX+25 && x[0]>mouseX-25) {
        v[1] = -v[1];
        v[0] = v[0] + 0.5*(mouseX-pmouseX);
      } else {
        x[0] = 100;
        x[1] = 400;
        v[0] = 0;
        v[1] = 0;
      }
    }
    if (x[0] < 0||x[0] > width) {
      v[0] = -v[0];
    }
    if (v[0] == 0&& v[1] == 0) {
      if (mousePressed) {
        v[0] = 2;
        v[1] = 2;
      }
    }
  }
  void display() {
    noStroke();
    fill(255, 255, 255);
    pushMatrix();
    translate(x[0], x[1], x[2]);
    sphere(10);
    popMatrix();
  }
  void barDisplay() {
    noStroke();
    fill(255, 0, 0);
    pushMatrix();
    beginShape();
    vertex(mouseX-25, 498, 5);
    vertex(mouseX+25, 498, 5);
    vertex(mouseX+25, 498, -5);
    vertex(mouseX-25, 498, -5);
    endShape(CLOSE);
    popMatrix();
  }
}

class Block {
  float[] x = new float[3];
  float d;
  Block(float[] a) {
    x = a;
    d = 20;
  }
  void display() {
    stroke(0);
    fill(102, 102, 102);
    pushMatrix();
    translate(x[0], x[1], x[2]);
    box(d);
    popMatrix();
  }
}

