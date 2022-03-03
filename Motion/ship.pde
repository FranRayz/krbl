PImage picture = new PImage();


class Ship {

  float angle = 0;
  float d = 0;
  float x;
  float y;
  String img;

  Ship(String img, float x, float y) {
    this.img = img;
    this.x = x;
    this.y = y;
  }

  void PostingImg() {
    picture = loadImage(this.img);
    //расчет положения изображения
    float new_x = this.x+8*cos(this.angle);
    float new_y = this.y+8*sin(this.angle);

    imageMode(CENTER);
    pushMatrix(); // запомнить текущую матрицу рисования
    translate(new_x, new_y);
    rotate(this.angle); // повернуть на 45 градусов
    image(picture, 0, 0);
    popMatrix(); // восстановить предыдущую графическую матрицу
    imageMode(CORNER);
  }

  void Move(int right, int left, int up, int down) {
    // Поворот влево и вправо
    IntList keysList = Keystrokes();

    for (int i = 0; i < keysList.size(); i++)
    {
      if (keysList.get(i) == right) {
        //dx = 1;
        angle += 0.0199;
      }
      if (keysList.get(i) == left) {
        //dx = -1;
        angle -= 0.0199;
      }

      // Движение вперед и назад
      if (keysList.get(i) == up) {
        //dy = -1;
 
        this.d += 0.01;
      }
      if (keysList.get(i) == down) {
        this.d -= 0.01;
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
  }
  float speed() {
    return this.d;
  }
}
