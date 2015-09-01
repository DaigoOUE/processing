void setup(){
  size(500,500);
  colorMode(HSB,100);
}

int flag = 0;

float c = 0;

void draw(){
  background(0);
  noStroke();
  fill(c,99,99);
  if(flag == 0){
  ellipse(mouseX,mouseY,30,30);
  }
  if(flag == 1){
    rectMode(CENTER);
    rect(mouseX,mouseY,30,30);
  }
  if(flag == 2){
    myTriangle(mouseX,mouseY,30);
  }
}

void myTriangle(float x,float y,float s){
  triangle(x,y-s*sqrt(3)/3,x-s/2,y+s*sqrt(3)/6,x+s/2,y+s*sqrt(3)/6);
}

void mousePressed(){
  c = random(0,100);
}

void keyPressed(){
  if(key == ' '){
    flag = (flag+1)%3;
  }
}
