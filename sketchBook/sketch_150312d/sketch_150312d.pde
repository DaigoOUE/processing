import hypermedia.video.*;
import java.awt.Rectangle;
import processing.video.*;

boolean rec = false;  // true: recording
int fps = 30;
int w = 640;
int h = 480;

OpenCV opencv;
MovieMaker mm;

PImage img;

void setup() {
size( w, h );

opencv = new OpenCV(this);
opencv.capture( width, height );
opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );

img = loadImage("ahegao.png");
imageMode(CORNER);

 if(rec){
  mm = new MovieMaker(this, w, h, "ahegao.mov", fps, MovieMaker.VIDEO, MovieMaker.LOSSLESS); 
  frameRate(fps);
 }

}

void draw() {
opencv.read();
image( opencv.image(), 0, 0 );
 Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );

for( int i=0; i<faces.length; i++){
image(img, faces[i].x, faces[i].y, faces[i].width, faces[i].height );
}
  if(rec){
    mm.addFrame(); 
  }
}


void keyPressed() { 
  if (key == ' ') { 
    if(rec){
       mm.finish(); 
    }
    exit();
  } 
}
