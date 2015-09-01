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
  size(500, 500);
  colorMode(HSB, 100);
  /***************/
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO);
  sine = new SineWave(440, 1.0, out.sampleRate()); //<- freq,amp,smpleRate
  sine.portamento(200);
  out.addSignal(sine);
  /***************/
}

void draw() {
  background(0);
  noStroke();
  fill(100*mouseX/width, 100*mouseY/height, 99);
  ellipse(mouseX, mouseY, 100, 100);
}

void mouseMoved() {
  float freq = map(mouseX, 0, width, 40, 2000);
  sine.setFreq(freq);
  float amp = map(mouseY, 0, height, 1.0, 0.0);
  sine.setAmp(amp);
}

void stop() {
  out.close();
  minim.stop();
  super.stop();
}

