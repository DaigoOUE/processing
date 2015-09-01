import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
SineWave sine;

void setup() {
  size(600, 200);
  colorMode(HSB, 100);
  frameRate(5000);
  smooth();
  strokeWeight(2);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO);
  sine = new SineWave(440, 1.0, out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine);
}

void draw() {
  background(0);
  stroke(100*mouseX/width, 99, 99);
  translate(0, height/2);
  for (int i = 1; i < out.bufferSize ()-1; ++i) {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float y1 = map(out.mix.get(i), 0, 1.0, 0, height/2);
    float x2 = map(i-1, 0, out.bufferSize(), 0, width);
    float y2 = map(out.mix.get(i-1), 0, 1.0, 0, height/2);
    line(x1, y1, x2, y2);
  }
}

void mouseMoved() {
  float freq = map(mouseX, 0, width, 40, 2000);
  float amp = map(mouseY, 0, height, 1.0, 0.0);
  sine.setFreq(freq);
  sine.setAmp(amp);
}

void stop() {
  out.close();
  minim.stop();
  super.stop();
}

