void setup() {
  size(500, 500, P3D);
  circle[0] = new Circle(30, origin, origin, 0);
  int i = 1;
  int j = 0;
  int k = 0;
  int count = 0;
  while (i < circle.length) {
    circle[i] = new Circle(circle[j].childSize(count), circle[j].childPos(count), circle[j].position, random(0, 255)%255);
    ++count;
    if (count == Num) {
      count = 0;
      ++j;
    }
    ++i;
  }
  colorMode(HSB);
  blendMode(ADD);
}

int mode = 0;  //0:noLoop 1:movie
int n = 4;
int Num = 12;

Circle[] circle = new Circle[(int)((pow(Num, n)-1)/(Num-1))];
float[] origin = {
  0, 0
};

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateZ(-PI/2);

  for (int l = 0; l < circle.length; ++l) {
    circle[l].display();
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("img/Num_"+Num+"n_"+n+"rand.png");
  }
}

class Circle {
  float diameter;
  float[] position = new float[2];
  float[] parentPos;
  float hue;
  float alpha;
  Circle(float d, float[] x, float[] p, float h) {
    diameter = d;
    position = x;
    parentPos = p;
    hue = h;
    alpha = 255*diameter/50;
  }
  void display() {
    strokeWeight(2*diameter/50);
    stroke(hue, 255, 255, alpha);
    line(position[0], position[1], parentPos[0], parentPos[1]);
  }

  float[] childPos(int i) {
    float[] x = new float[2];
    x[0] = position[0] + 1.5*diameter*cos(TWO_PI*i/Num);
    x[1] = position[1] + 1.5*diameter*sin(TWO_PI*i/Num);
    return(x);
  }

  float childSize(int i) {
    return(diameter*0.9);
  }
}

