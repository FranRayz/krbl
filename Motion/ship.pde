PImage picture = new PImage();


class Ship {

  float angle = 0;
  float d = 0;
  PVector vector;
  String img;

  Ship(String img, PVector vector) {
    this.img = img;
    this.vector = vector;
  }

  void PostingImg() {
    picture = loadImage(this.img);
    //расчет положения изображения
    float new_x = this.vector.x+8*cos(this.angle);
    float new_y = this.vector.y+8*sin(this.angle);

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
        angle += 0.0199+d;
      }
      if (keysList.get(i) == left) {
        //dx = -1;
        angle -= 0.0199+d;
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
      this.vector.x = this.vector.x - d * cos(angle);
      this.vector.y = this.vector.y - d * sin(angle);
      d = d * (-1);
    }

    //Замедление движения назад
    if (d < 0) {
      d += 0.004;
      d = d * (1);
      this.vector.x = this.vector.x + d * cos(angle);
      this.vector.y = this.vector.y + d * sin(angle);
      d = d * (1);
    }
  }
  float speed() {
    return this.d;
  }
}
