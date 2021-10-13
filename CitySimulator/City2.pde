Drop[] drops= new Drop[200];
Snow[] snows= new Snow[200];

PImage car; //car image
float vx; //velocity of car
float green;
float blue;

void setup()
{
  green=170;
  blue=252;
  car= loadImage("car.png");
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
  background(0, green, blue);
  road();
  image(car, 0+vx, 560, 150, 100);
  vx++;
  building(0, 150);
  building(200, 150);
  building(400, 150);
  building(600, 150);
    noStroke();
    weather();
}

void weather()
{
  if (key=='r') {
    for (int i=0; i<drops.length; i++) {
    drops[i].show();
    drops[i].fall(); }
    //2d array to make rain
    //can also control intensity
  }
  if (key=='s') {
    for (int k=0; k<snows.length; k++) {
    snows[k].show();
    snows[k].fall(); }
    //2d array to make snow
  }
  if (key=='c') {
    //back to a clear day
  }
}

void building(float xPos, float yPos)
{
  fill(255, 200, 0);
  rect(xPos, yPos, 150, height/2.07);
  fill(0);
  for (int y=0; y<280; y=y+70) {
    for (int x=0; x<140; x=x+70) {
      rect(xPos+20+x, 170+y, 40, 50);
    }
  }
  fill(#964B00);
  rect(xPos+60, 460, 40, 75);
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
