import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioSample bassdrum, snare, hat;

void setup() {
  size(800, 400);
  colorMode(HSB, 100);
  smooth();
  minim = new Minim(this);
  bassdrum = minim.loadSample("drum1_bassdrum1.wav");
  snare = minim.loadSample("drum1_snare.wav");
  hat = minim.loadSample("drum1_hat.wav");
  background(40);
}

Circle[] circle = new Circle[20];
Square[] square = new Square[20];
Trigon[] trigon = new Trigon[20];
int nc = 0;
int ns = 0;
int nt = 0;
int N = max(nc, ns, nt);

Bar b = new Bar();

float time = 0;
int back = 1;
void draw() {
  N = max(nc, ns, nt);
  if (back == 1) {
    background(60);
  }
  b.display();
  stroke(0);
  for (int i = 0; i < 8; ++i) {
    float x = map(i, 0, 8, 0, width);
    strokeWeight(2);
    line(x, 0, x, height);
    strokeWeight(1);
    line(x+width/16, 0, x+width/16, height);
    line(x+width/32, 0, x+width/32, height);
    line(x+3*width/32, 0, x+3*width/32, height);
  }
  reset();
  controlPanel();
  controlShape();
  for (int i = 0; i < N; ++i) {
    if (i < nc) {
      circle[i].display(b);
    }
    if (i < ns) {
      square[i].display(b);
    }
    if (i < nt) {
      trigon[i].display(b);
    }
  }
  time += 3;
}

void stop() {
  bassdrum.close();
  minim.stop();
  super.stop();
}

int cnt = 0;
int t = 0;
void reset() {
  if (cnt == 1) {
    rectMode(CORNER);
    noStroke();
    float Exp = 100-100*exp(-0.01*t);
    if (Exp > 30) {
      cnt = 0;
      t = 0;
      println(cnt);
      Exp = 100;
    }
    fill(40, Exp);
    rect(0, 0, width, height);
    ++t;
  }
}

void controlShape() {
  for (int i = 0; i < N; ++i) {
    if (i < nc) {
      if (circle[i].flag == 1) {
        circle[i].move();
      }
    }
    if (i < ns) {
      if (square[i].flag == 1) {
        square[i].move();
      }
    }
    if (i < nt) {
      if (trigon[i].flag == 1) {
        trigon[i].move();
      }
    }
  }
}

float c0 = 0;
float r0 = (c0+33)%100;
float t0 = (r0+33)%100;
void controlPanel() {
  fill(20);
  noStroke();
  rectMode(CORNER);
  rect(10, 10, 185-50*sqrt(3)/6+25*sqrt(3), 70);

  strokeWeight(2);

  stroke((c0+50)%100, 99, 99);
  fill(c0%100, 99, 99);
  if (mousePressed) {
    if (pow(mouseX-45, 2)+pow(mouseY-45, 2)<pow(25, 2)) {
      stroke(c0%100, 99, 99);
      fill((c0+50)%100, 99, 99);
    }
  }
  ellipse(45, 45, 50, 50);

  stroke((r0+50)%100, 99, 99);
  fill(r0%100, 99, 99);
  if (mousePressed) {
    if (mouseX > 90 && mouseX < 140) {
      if (mouseY > 20 && mouseY < 70) {
        stroke(r0%100, 99, 99);
        fill((r0+50)%100, 99, 99);
      }
    }
  }
  rectMode(CORNER);
  rect(90, 20, 50, 50);

  stroke((t0+50)%100, 99, 99);
  fill(t0%100, 99, 99);
  if (mousePressed) {
    if (mouseX > 185-50*sqrt(3)/6) {
      if (mouseY > 20+tan(radians(30))*(mouseX-185+50*sqrt(3)/6)) {
        if (mouseY < 70-tan(radians(30))*(mouseX-185+50*sqrt(3)/6)) {
          stroke(t0%100, 99, 99);
          fill((t0+50)%100, 99, 99);
        }
      }
    }
  }
  triangle(185+50*sqrt(3)/3, 45, 185-50*sqrt(3)/6, 20, 185-50*sqrt(3)/6, 70);
}

void mousePressed() {
  for (int i = 0; i < nc; ++i) {
    if (pow(mouseX-circle[i].x[0], 2)+pow(mouseY-circle[i].x[1], 2)<pow(circle[i].d/2, 2)) {
      circle[i].flag = (circle[i].flag + 1) % 2;
      return;
    }
  }
  if (nc < circle.length) {
    if (pow(mouseX-45, 2)+pow(mouseY-45, 2)<pow(25, 2)) {
      float[] mouse = {
        mouseX, mouseY
      };
      circle[nc] = new Circle(50, mouse);
      ++nc;
    }
  }
  for (int i = 0; i < ns; ++i) {
    if ((abs(mouseX-square[i].x[0]) < square[i].d/2)&&(abs(mouseY-square[i].x[1]) < square[i].d/2)) {
      square[i].flag = (square[i].flag + 1) % 2;
      return;
    }
  }
  if (ns < square.length) {
    if (mouseX > 90 && mouseX < 140) {
      if (mouseY > 20 && mouseY < 70) {
        float[] mouse = {
          mouseX, mouseY
        };
        square[ns] = new Square(50, mouse);
        ++ns;
      }
    }
  }
  for (int i = 0; i < nt; ++i) {
    if ((abs(mouseX-trigon[i].x[0]) < trigon[i].d/2)&&(abs(mouseY-trigon[i].x[1]) < trigon[i].d/2)) {
      trigon[i].flag = (trigon[i].flag + 1) % 2;
      return;
    }
  }
  if (nt < trigon.length) {
    if (mouseX > 185-50*sqrt(3)/6) {
      if (mouseY > 20+tan(radians(30))*(mouseX-185+50*sqrt(3)/6)) {
        if (mouseY < 70-tan(radians(30))*(mouseX-185+50*sqrt(3)/6)) {
          float[] mouse = {
            mouseX, mouseY
          };
          trigon[nt] = new Trigon(50, mouse);
          ++nt;
        }
      }
    }
  }
}

void keyPressed() {
  if (key == 'a') {
    ++c0;
    r0 = (c0+33)%100;
    t0 = (r0+33)%100;
  }
  if (key == 'z') {
    --c0;
    r0 = (c0+33)%100;
    t0 = (r0+33)%100;
  }
  if (key == ' ') {
    cnt = 1;
    println(cnt);
  }
  if (key == '1') {
    back = (back+1)%2;
  }
  if (key == '.') {
    circle = new Circle[10];
    square = new Square[10];
    trigon = new Trigon[10];
    nc = 0;
    ns = 0;
    nt = 0;
  }
}

class Bar {
  int judge(float x) {
    if (x<time%800) {
      return(1);
    } else {
      return(0);
    }
  }
  void display() {
    rectMode(CORNER);
    noStroke();
    fill(20, 30, 99);
    rect(0, 0, time%800, height);
  }
}


class Circle {
  float[] x = new float[2]; 
  float d;
  float h = c0;
  float s = 99;
  float b = 99;
  int flag = 1;
  int pl = 0;
  int nl = 0;
  Circle(float a, float[] b) {
    d = a;
    x = b;
  }
  void move() {
    if (flag == 1) {
      x[0] = mouseX;
      x[1] = mouseY;
    }
  }
  void setLocate(Bar bar) {
    pl = nl;
    nl = bar.judge(x[0]);
  }

  int T = 0;
  float r = 0;
  float temp = 0;
  int f1 = 0;
  int f2 = 0;
  void dispChild() {
    fill(h, 2.5*(55-r), b);
    if (nl == 1) {
      r = 40-40*exp(-0.06*(T-f1));
      if (nl != pl) {
        bassdrum.trigger();
      }
      for (int i = 0; i < 6; ++i) {
        ellipse(x[0]+r*cos(radians(i*60+(h+100)/100*time)), x[1]+r*sin(radians(i*60+(h+100)/100*time)), 10, 10);
      }
      f2 = T;
    } else {
      if (r > 18) {
        r = 40*exp(-0.04*(T-f2));
      } else {
        r = 0;
        f2 = 0;
      }
      for (int i = 0; i < 6; ++i) {
        ellipse(x[0]+r*cos(radians(i*60+(h+100)/100*time)), x[1]+r*sin(radians(i*60+(h+100)/100*time)), 10, 10);
      }
      f1 = T;
    }
    ++T;
  }
  void display(Bar bar) {
    stroke(0);
    setLocate(bar);
    dispChild();
    fill(h, s, b);
    ellipse(x[0], x[1], d, d);
  }
}

class Square {
  float[] x = new float[2];
  float d;
  float h = r0;
  float s = 99;
  float b = 99;
  int flag = 1;
  int nl = 0;
  int pl = 0;
  Square(float a, float[] b) {
    d = a;
    x = b;
  }
  void move() {
    if (flag == 1) {
      x[0] = mouseX;
      x[1] = mouseY;
    }
  }
  void setLocate(Bar bar) {
    pl = nl;
    nl = bar.judge(x[0]);
  }
  void display(Bar bar) {
    setLocate(bar);
    stroke(0);
    fill(h, s, b);
    rectMode(CENTER);
    if (nl == 1) {
      rect(x[0], x[1], 2*d, 2*d);
      if (nl != pl) {
        snare.trigger();
      }
    } else {
      rect(x[0], x[1], d, d);
    }
  }
}

class Trigon {
  float[] x = new float[2];
  float d;
  float h = t0;
  float s = 99;
  float b = 99;
  int flag = 1;
  int nl = 0;
  int pl = 0;
  Trigon(float a, float[] b) {
    d = a;
    x = b;
  }
  void move() {
    if (flag == 1) {
      x[0] = mouseX;
      x[1] = mouseY;
    }
  }
  void setLocate(Bar bar) {
    pl = nl;
    nl = bar.judge(x[0]);
  }
  void display(Bar bar) {
    setLocate(bar);
    if (nl == 1) {
      if (nl != pl) {
        hat.trigger();
      }
    }
    stroke(0);
    fill(h, s, b);
    pushMatrix();
    translate(x[0], x[1]);
    triangle(d*cos(radians((h+100)/100*time))*sqrt(3)/3, -d*sin(radians((h+100)/100*time))*sqrt(3)/3, 
    -d*cos(radians((h+100)/100*time))*sqrt(3)/6-d*sin(radians((h+100)/100*time))/2, d*sin(radians((h+100)/100*time))*sqrt(3)/6-d*cos(radians((h+100)/100*time))/2, 
    -d*cos(radians((h+100)/100*time))*sqrt(3)/6+d*sin(radians((h+100)/100*time))/2, d*sin(radians((h+100)/100*time))*sqrt(3)/6+d*cos(radians((h+100)/100*time))/2);
    popMatrix();
  }
}

