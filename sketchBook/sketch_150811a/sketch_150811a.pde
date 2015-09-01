void setup() {
  size(500, 500);
  smooth();
}

Bar bar = new Bar();

void draw() {
  background(0);
  bar.display();
  noStroke();
  fill(255);
  ellipse(width/2, 2*height/3, 10, 10);
}

class Bar {
  float[][] x = new float[2][2];
  int now;

  Bar() {
    now = 3;
    for (int i = 0; i < 2; ++i) {
      x[i][0] = random(0, 500);
      x[i][1] = random(0, 500);
    }
  }

  int judge() {
    for (int i = 0; i < 2; ++i) {
      if (mousePressed && abs(x[i][0]-mouseX) < 30 && abs(x[i][1]-mouseY) < 30) {
        return(i);
      }
    }
    return(3);
  }

  void setPar() {
    now = judge();
    if (now != 3) {
      x[now][0] = mouseX;
      x[now][1] = mouseY;
    }
  }

  void display() {
    setPar();
    stroke(255);
    line(x[0][0], x[0][1], x[1][0], x[1][1]);
  }
}

