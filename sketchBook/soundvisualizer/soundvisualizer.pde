/*Copyright (c) 2015 Daigo OUE All Rights Reserved */

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import java.lang.Math;

Minim minim;
AudioInput in;

FFT fft;

PImage heart;
PImage warning;

void setup() {
  size(960, 381, P3D);
  colorMode(HSB, 100);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 1024);

  fft = new FFT(in.bufferSize(), in.sampleRate());

  heart = loadImage("img/heart.png");
  warning = loadImage("img/warning.png");
  background(100);
}

int t = 0;
int flag = 0;

void draw() {
  fade();

  fft.forward(in.mix);
  int max_freq = 0;
  for (int i = 0; i < fft.specSize (); ++i) {
    if (fft.getBand(i)>fft.getBand(max_freq)) {
      max_freq = i;
    }
  }

  float magnification = fft.getBand(max_freq);
  float w = (1+magnification/100)*heart.width/2;
  float h = (1+magnification/100)*heart.height/2;
  image(heart, width/2-w/2, height/2-h/2, w, h);

  for (int i = 0; i < in.bufferSize () - 1; i++) {
    stroke(2000*max_freq/fft.specSize(), 99, 50, 40);
    line(i, height/2 + in.left.get(i)*1000, i+1, height/2 + in.left.get(i+1)*1000);
  }

  float s = 20+10*magnification;
  fill(2000*max_freq/fft.specSize(), 99, 50);
  textSize(s);
  pushMatrix();
  translate(width/2, height/2);
  rotateZ(-TWO_PI*magnification/1000);
  text("Sound Visualizer", -8.1*s/2, 1.5*s/4);
  popMatrix();


  if (magnification/1000 > 0.03) {
    noStroke();
    fill(0, 40, 40, 40);
    rectMode(CORNER);
    rect(0, 0, width, height);
    float wid = warning.width/2;
    float hei = warning.height/2;
    image(warning, width/2-wid/2, height/2-hei/2, wid, hei);
    flag = 1;
  } else if (flag == 1) {
    background(100);
    flag = 0;
  }

  t += 1;
}

void fade() {
  rectMode(CORNER);
  noStroke();
  fill(0, 0, 99, 10);
  rect(0, 0, width, height);
}

