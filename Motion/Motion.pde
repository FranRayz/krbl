import controlP5.*;
ControlP5 cp5;

float x, y, dx, dy;
float angle = 0;
float d = 0;
PImage img;
PVector pos;

void setup() {
  size(1900, 1000);
  frameRate(60);
  img = loadImage("blueship1.png");
  x = width/2;
  y = height/2;
}

void draw() {
  background(0, 0, 0);
  
  // Поворот влево и вправо
  if (keyPressed) {
    //if (key == CODED) {
    if (keyCode == RIGHT) {
      //dx = 1;
      angle += 0.01 * d;
    } else if (keyCode == LEFT) {
      //dx = -1;
      angle -= 0.01 * d;
    }
    
    // Движение вперед и назад
    if (keyCode == UP) {
      //dy = -1;
      d += 0.01;
    } else if (keyCode == DOWN) {
      d -= 0.01;
    }
  }
  
  // Замедление движения вперед
  if (d > 0) {
    d -= 0.004;
    d = d * (-1);
    x = x - d * cos(angle);
    y = y - d * sin(angle);
    d = d * (-1);
  }
  
  //Замедление движения назад
  if (d < 0) {
    d += 0.004;
    d = d * (1);
    x = x + d * cos(angle);
    y = y + d * sin(angle);
    d = d * (1);
  }
  
  float new_x = x+50*cos(angle);
  float new_y = y+50*sin(angle);
  imageMode(CENTER);
  pushMatrix(); // remember current drawing matrix)
  translate(new_x, new_y);
  rotate(angle); // rotate 45 degrees
  image(img, 0, 0);
  popMatrix(); // restore previous graphics matrix
  imageMode(CORNER);
  println(d);
}
