import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
SineWave sine1,sine2;

void setup(){
  size(500,500);
  colorMode(HSB,100);
  frameRate(30);
  smooth();
  strokeWeight(2);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine1 = new SineWave(440,0.8,out.sampleRate());
  sine1.portamento(200);
  sine1.setPan(-1);
  out.addSignal(sine1);
  sine2 = new SineWave(440,0.8,out.sampleRate());
  sine2.portamento(200);
  sine2.setPan(1);
  out.addSignal(sine2);
  background(0);
}

float freq1,freq2;

void draw(){
  noStroke();
  fill(0,0,0,20);
  rect(0,0,width,height);
  
  translate(width/2,height/2);
  
  noFill();
  float a = 100*(freq1-40)/1960;
  float b = 100*(freq2-40)/1960;
  stroke((a+b)%100,99,99);
  
  for(int i = 0; i < out.bufferSize()-1;++i){
    point(out.right.get(i)*width/2,out.left.get(i)*height/2);
  }
}

void mouseMoved(){
  freq1 = map(mouseX, 0, width, 40, 2000);
  freq2 = map(mouseY, 0, height, 20, 1000);
  sine1.setFreq(freq1);
  sine2.setFreq(freq2);
}

void stop(){
  out.close();
  minim.stop();
  super.stop();
}
