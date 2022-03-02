import controlP5.*;
ControlP5 cp5;

float x, y, dx, dy;
float angle = 0;
float d = 0;
PImage img;
//PVector pos, vel;

void setup() {
  size(1900, 1000);
  
  //pos = new PVector(width/2, height/2);
  
  img = loadImage("blueship1.png");
  
  x = width/2;
  y = height/2;

  frameRate(60);
  
   cp5 = new ControlP5(this);
   cp5.addSlider("speed")
     .setPosition(10,10)
     .setSize(100,20)
     .setRange(-100,200)
     ;
  
}

// test

//void speed(int val){
//  vel.normalize();
//  vel.mult(val);
//  println(vel);
//}


void draw() {
  background(0, 0, 0);
  // ускорение/движение вперед и назад
  // добавить ограничения скорости!!!!!!!!!!!!!!
  // Поворот лево/вправо
  if (keyPressed) {
    //if (key == CODED) {
      if (keyCode == RIGHT) {
        //dx = 1;
        angle += 0.01 * d;
      } else if (keyCode == LEFT) {
        //dx = -1;
        angle -= 0.01 * d;
      }
      if (keyCode == UP) {
        //dy = -1;
        d += 0.01;
        if(d > 0){
           x = x + d * cos(angle) ;
           y = y + d * sin(angle) ;
        }
        //cp5.getController("speed").setValue(d);
      } else if (keyCode == DOWN) {
        //dy = 1;
        d -= 0.01;
        if(d < 0){
           d = d * (-1);
           x = x - d * cos(angle);
           y = y - d * sin(angle);
           d = d * (-1);
    //}
  }
        //cp5.getController("speed").setValue(d);
      }
  }
  if(d > 0){
      d -= 0.004;
      d = d * (-1);
      x = x - d * cos(angle);
      y = y - d * sin(angle);
      d = d * (-1);
      //cp5.getController("speed").setValue(int(d));
  }
    if(d < 0){
      d += 0.004;
      d = d * (1);
      x = x + d * cos(angle);
      y = y + d * sin(angle);
      d = d * (1);
      //cp5.getController("speed").setValue(int(d));
  }
  x +=dx;
  y +=dy;
  fill(0, 255, 0);
  stroke(126);
  float new_x = x+50*cos(angle);
  float new_y = y+50*sin(angle);

  //ellipse(x,y,150,150);
  //line(x, y, new_x, new_y);
  //float new__x = x-100*cos(angle);
  //float new__y = y-100*sin(angle);

  imageMode(CENTER);
  //image(img, new_x, new_y);
  pushMatrix(); // remember current drawing matrix)
  translate(new_x, new_y);
  rotate(angle); // rotate 45 degrees
  image(img, 0, 0);
  popMatrix(); // restore previous graphics matrix
  imageMode(CORNER);
  //line(new__x, new__y, new_x, new_y);
  dx = 0;
  dy = 0;
  println(d);
}
