Drop[] drops= new Drop[400];
Snow[] snows= new Snow[200];

PImage car, car2; //car images
float vx=-150; //velocity of car 1
float vx2=700; // velocity of car 2
float green;
float blue;
boolean raining= false;
boolean snowing= false;
boolean lighting= false;
boolean night= false;
boolean day=false;
boolean lights=false;

void setup()
{
  green=170;
  blue=252;
  car= loadImage("car.png");
  car2= loadImage("car2.png");
  size(700, 800);
  for (int i=0; i<drops.length; i++) {
    drops[i] = new Drop();
  }
  for (int k=0; k<snows.length; k++) {
    snows[k] = new Snow();
  }
}

void draw()
{
  time();
  road();
  image(car, vx, 560, 150, 100);
  vx=vx+2;
  if (vx >= 700) {
    vx=-150;
  }
  image(car2, vx2, 685, 150, 100);
  vx2=vx2-2;
  if (vx2 <= -150) {
    vx2=700;
  }
  building(0, 150);
  building(200, 150);
  building(400, 150);
  building(600, 150);
  weather();
  noStroke();
}

void weather()
{
  if (key=='r') {
    raining=true;
    snowing=false;
  }
  if (raining== true) {
    for (int i=0; i<drops.length; i++) {
      drops[i].show();
      drops[i].fall();
    }
  }
  if (key=='s') {
    snowing=true;
    raining=false;
  }
  if (snowing==true) {
    for (int k=0; k<snows.length; k++) {
      snows[k].show();
      snows[k].fall();
    }
  }
  if (key=='c') {
    snowing=false;
    raining=false;
  }
}

void building(float xPos, float yPos)
{
  fill(80, 25, 33);
  rect(xPos, yPos, 150, height/2.07);
  fill(0);
  for (int y=0; y<280; y=y+70) {
    for (int x=0; x<140; x=x+70) {
      rect(xPos+20+x, 170+y, 40, 50);
      if (key == 'o') {
        lights=true;
      }
      if (lights==true) {
        fill(#FAFF00);
      } else {
        fill(0);
      }
      if (key == 'f') {
        lights=false;
      }
      if (lights==false) {
        fill(0);
      }
    }
  }
  fill(#964B00);
  rect(xPos+60, 460, 40, 75);
  fill(#FAFF00);
  circle(xPos+65, 497.5, 5);
  noStroke();
}

void road()
{
  fill(0);
  rect(0, height/1.5, width, height/1.5);
  for (int xPos2=0; xPos2<width; xPos2+=90) {
    fill(#FFE600);
    rect(xPos2, height/1.2, 50, 15);
    noStroke();
  }
}

void time()
{
  if (key=='n') {
    night=true;
    day=false;
  }
  if (night==true) {
    background(0, 4, 77);  //0,4,77
  } else
  {
    background(0, green, blue);
  }
  if (key=='d') {
    day=true;
    night=false;
  }
  if (day==true) {
    background(0, 170, 252);
  }
}
