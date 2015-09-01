import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

int counter = 0;
SBall[] sball = new SBall[30];
BBall[] bball = new BBall[150];
Button[] button = new Button[17];
Minim minim;
AudioSample C3, C_3, D3, D_3, E3, F3, F_3, G3, G_3, A3, A_3, B3, C4, C_4, D4, D_4, E4; 

void setup() {
  size(500, 500, P3D);
  colorMode(HSB, 100);
  background(50, 99, 50);
  for (int i = 0; i < sball.length; ++i) {
    sball[i] = new SBall(' ', i);
    sball[i].d = 0;
  }
  for (int i = 0; i < bball.length; ++i) {
    bball[i] = new BBall();
  }
  minim = new Minim(this);
  C3 = minim.loadSample("C3.wav");
  C_3 = minim.loadSample("C#3.wav");
  D3 = minim.loadSample("D3.wav");
  D_3 = minim.loadSample("D#3.wav");
  E3 = minim.loadSample("E3.wav");
  F3 = minim.loadSample("F3.wav");
  F_3 = minim.loadSample("F#3.wav");
  G3 = minim.loadSample("G3.wav");
  G_3 = minim.loadSample("G#3.wav");
  A3 = minim.loadSample("A3.wav");
  A_3 = minim.loadSample("A#3.wav");
  B3 = minim.loadSample("B3.wav");
  C4 = minim.loadSample("C4.wav");
  C_4 = minim.loadSample("C#4.wav");
  D4 = minim.loadSample("D4.wav");
  D_4 = minim.loadSample("D#4.wav");
  E4 = minim.loadSample("E4.wav");
  button[0] = new Button('q');
  button[1] = new Button('w');
  button[2] = new Button('e');
  button[3] = new Button('r');
  button[4] = new Button('t');
  button[5] = new Button('y');
  button[6] = new Button('u');
  button[7] = new Button('i');
  button[8] = new Button('o');
  button[9] = new Button('p');
  button[10] = new Button('2');
  button[11] = new Button('3');
  button[12] = new Button('5');
  button[13] = new Button('6');
  button[14] = new Button('7');
  button[15] = new Button('9');
  button[16] = new Button('0');
}

void draw() {
  background(50, 99, 50);
  lights();
  for (int i = 0; i < bball.length; ++i) {
    bball[i].run();
  }
  for (int i = 0; i < sball.length; ++i) {
    sball[i].run();
  }
  panel();
}

void panel() {
  fill(0, 0, 80);
  beginShape();
  vertex(20, 430, 0);
  vertex(220, 430, 0);
  vertex(220, 480, 0);
  vertex(20, 480, 0);
  endShape(CLOSE);
  translate(27, 455, 0);
  pushMatrix();
  for (int i = 0; i < 10; ++i) {
    fill(0, 0, 99);
    button[i].display();
    translate(19, 0, 0);
  }
  popMatrix();
  pushMatrix();
  translate(9.5, -19, 0);
  for (int i = 0; i < 7; ++i) {
    fill(0, 0, 0);
    button[i+10].display();
    if (i == 1||i == 4) {
      translate(38, 0, 0);
    } else {
      translate(19, 0, 0);
    }
  }
  popMatrix();
}

void keyJudge(char a) {
  if (a == 'q') {
    C3.trigger();
  }
  if (a == 'w') {
    D3.trigger();
  }
  if (a == 'e') {
    E3.trigger();
  }
  if (a == 'r') {
    F3.trigger();
  }
  if (a == 't') {
    G3.trigger();
  }
  if (a == 'y') {
    A3.trigger();
  }
  if (a == 'u') {
    B3.trigger();
  }
  if (a == 'i') {
    C4.trigger();
  }
  if (a == 'o') {
    D4.trigger();
  }
  if (a == 'p') {
    E4.trigger();
  }
  if (a == '2') {
    C_3.trigger();
  }
  if (a == '3') {
    D_3.trigger();
  }
  if (a == '5') {
    F_3.trigger();
  }
  if (a == '6') {
    G_3.trigger();
  }
  if (a == '7') {
    A_3.trigger();
  }
  if (a == '9') {
    C_4.trigger();
  }
  if (a == '0') {
    D_4.trigger();
  }
}

float colorOf(char a) {
  if (a == 'q') {
    return(0);
  }
  if (a == 'w') {
    return(14.3);
  }
  if (a == 'e') {
    return(28.6);
  }
  if (a == 'r') {
    return(42.9);
  }
  if (a == 't') {
    return(57.2);
  }
  if (a == 'y') {
    return(71.5);
  }
  if (a == 'u') {
    return(85.8);
  }
  if (a == 'i') {
    return(0);
  }
  if (a == 'o') {
    return(14.3);
  }
  if (a == 'p') {
    return(28.6);
  }
  if (a == '2') {
    return(7.15);
  }
  if (a == '3') {
    return(21.45);
  }
  if (a == '5') {
    return(50.05);
  }
  if (a == '6') {
    return(64.35);
  }
  if (a == '7') {
    return(78.65);
  }
  if (a == '9') {
    return(7.15);
  }
  if (a == '0') {
    return(21.45);
  } else {
    return(200);
  }
}

void stop() {
  C3.close();
  C_3.close();
  D3.close();
  D_3.close();
  E3.close();
  F3.close();
  F_3.close();
  G3.close();
  G_3.close();
  A3.close();
  A_3.close();
  B3.close();
  C4.close();
  C_4.close();
  D4.close();
  D_4.close();
  E4.close();
  minim.stop();
  super.stop();
}

void keyPressed() {
  if (counter < sball.length) {
    sball[counter] = new SBall(key, counter);
    keyJudge(key);
    ++counter;
  } else {
    counter = 0;
  }
}

class Button {
  char label;
  Button(char a) {
    label = a;
  }
  void display() {
    if (keyPressed&&key == label) {
      fill(0, 99, 99);
    }
    beginShape();
    vertex(0, 0, 0);
    vertex(15, 0, 0);
    vertex(15, 15, 0);
    vertex(0, 15, 0);
    endShape(CLOSE);
    fill(10, 99, 99);
    text(label, 3, 10);
  }
}

class BBall {
  float[] x = new float[3];
  float v;
  BBall() {
    float rand = random(0, 1);
    if (rand < 0.25) {
      x[0] = random(-400, 0);
      x[1] = random(-400, 900);
    } else if (rand < 0.5) {
      x[0] = random(-400, 900);
      x[1] = random(-400, 0);
    } else if (rand < 0.75) {
      x[0] = random(500, 900);
      x[1] = random(-400, 900);
    } else {
      x[0] =random(-400, 900);
      x[1] = random(500, 900);
    }
    x[2] = random(-5000, 0);
    v = random(100, 300);
  }
  void move() {
    x[2] = (x[2]-v)%5000;
  }
  void display() {
    pushMatrix();
    translate(x[0], x[1], x[2]);
    noStroke();
    fill(0, 0, 99);
    sphere(10);
    popMatrix();
  }
  void run() {
    move();
    display();
  }
}

class SBall {
  float[] x = new float[3];
  char h;
  float d;
  int label;
  SBall(char a, int b) {
    h = a;
    d = 30;
    label = b;
    for (int i = 0; i < 2; ++i) {
      x[i] = random(-400, 900);
    }
    x[2] = 0;
  }

  void move() {
    x[2] -= 100;
    if (x[2] < -5000) {
      d = 0;
    }
  }
  void run() {
    move();
    if (colorOf(h) < 100) {
      fill(colorOf(h), 99, 99);
    } else {
      fill(0, 0, 0, 0);
    }
    noStroke();
    pushMatrix();
    translate(x[0], x[1], x[2]);
    sphere(d);
    popMatrix();
  }
}

