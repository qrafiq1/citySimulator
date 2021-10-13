class Snow{
  float x= random(0, width);
  float y=random(-100, 0);
  float z=random(0,20);
  float len=map(z,0,20,10,20);
  float yspeed=map(z,0,20,4,10);
  float d=random(1,10);

  void fall() {
    y=y+ yspeed;
    float grav= map(z,0,20,0.01,0.2);
     yspeed=yspeed+grav;
    if (y>height) {
      y=random(-100, 0);
      yspeed=map(z,0,20,4,10);
    }
  }

  void show() {
    fill(255);
    circle(x, y, d);
  }
}
