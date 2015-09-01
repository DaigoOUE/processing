int SIZEx = 600;
int SIZEy = 400;

void setup() {
  size(600, 400);
  for (int i = 0; i < task.length; ++i) {
    task[i] = new Task(false);
  }
}

Panel panel = new Panel();
List list = new List();
Task task[] = new Task[10];

float panex = 0;
float listx = 0;
int last = 0;

void draw() {
  background(0);
  for (int i = 0; i < task.length; ++i) {
    task[i].display();
  }
  panel.display();
  list.display();
}

class Panel {
  float x;
  Panel() {
    x = 0;
  }
  void display() {
    move();
    noStroke();
    fill(204, 80);
    rectMode(CORNER);
    rect(0, 0, x, height);
    fill(50);
    rect(x, 0, 5, height);
    action();
  }
  void move() {
    if (mouseX < SIZEx/10) {
      if (x <= width/10) { 
        x += (width/10-x)/10;
      }
    } else {
      if (x > 0) {
        x -= abs(x)/10;
      }
    }
    panex = x;
  }
  void createTask() {
    int i;
    for (i = 0; i < task.length; ++i) {
      if (task[i].b == false) {
        task[i] = new Task("test");
        break;
      }
    }
    if (i == task.length-1) {
      fill(255, 255, 0);
      text("limmit of task", width/2, height/2);
      delay(1000);
    }
  }

  void deleteTask() {
    for (int i = 0; i < task.length; ++i) {
      if (task[i].progress >= 100) {
        task[i].b = false;
      }
    }
  }
  void actionboard() {
    rectMode(CENTER);
    stroke(255, 0, 0);
    fill(204, 0, 0);
    rect(x-width/20, height/20, width/12, height/15);

    rectMode(CENTER);
    stroke(0, 255, 0);
    fill(0, 204, 0);
    rect(x-width/20, height/20+height/15+10, width/12, height/15);

    rectMode(CENTER);
    stroke(0, 0, 255);
    fill(0, 0, 204);
    rect(x-width/20, height/20+2*height/15+20, width/12, height/15);
  }
  void action() {
    actionboard();
    if (mousePressed && 
      mouseX < x-width/20+width/24 &&
      mouseX > x-width/20-width/24 &&
      mouseY < height/20+height/30 &&
      mouseY > height/20-height/30)
    {
      createTask();
      delay(500);
    }
    if (mousePressed && 
      mouseX < x-width/20+width/24 &&
      mouseX > x-width/20-width/24 &&
      mouseY < height/20+height/15+10+height/30 &&
      mouseY > height/20+height/15+10-height/30)
    {
      deleteTask();
      delay(500);
    }
    if (mousePressed && 
      mouseX < x-width/20+width/24 &&
      mouseX > x-width/20-width/24 &&
      mouseY < height/20+2*height/15+20+height/30 &&
      mouseY > height/20+2*height/15+20-height/30)
    {
      fill(0, 0, 255);
      text("blue button pressed", width/2, height/2);
    }
  }
}

class Task {
  String name;
  int progress = 100;
  float rand;
  float x, y, vx, vy;
  boolean b;
  Task(String n) {
    x = SIZEx/2;
    y = SIZEy/2;
    rand = random(0, TWO_PI);
    vx = progress*cos(rand)/5;
    vy = progress*sin(rand)/5;
    b = true;
  }
  Task(boolean bool) {
    b = bool;
  }
  void display() {
    if (b) {
      move();
      noStroke();
      fill(255);
      ellipse(x, y, 30, 30);
    }
  }

  void setProg(int p) {
    progress = p;
    vx = progress*cos(rand)/5;
    vy = progress*sin(rand)/5;
  }
  void move() {
    x += vx;
    y += vy;
    if (y < 0||y > height) {
      y = y - vy;
      vy = -vy;
    }
    if (x < panex||x > listx) {
      x = x - vx;
      vx = -vx;
    }
  }
}

class List {
  float x;
  int flag = 0;
  List() {
    x = SIZEx;
  }
  void display() {
    move();
    noStroke();
    fill(204, 80);
    rectMode(CORNER);
    rect(x, 0, SIZEx/5, height);
    fill(50);
    rect(x-5, 0, 5, height);
  }
  void judge() {
    if (mouseX > 4*SIZEx/5) {
      flag = 1;
    } else {
      flag = 0;
    }
  }
  void move() {
    judge();
    if (flag == 1) {
      if (x >= SIZEx*4/5) { 
        x -= abs(4*SIZEx/5-x)/10;
      }
    } else {
      x += abs(SIZEx-x)/10;
    }
    listx = x;
  }
}