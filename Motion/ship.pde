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

  void Move(int right, int left, int up, int down, char s) {
    // Поворот влево и вправо

    if (s == 'd') {
      if (keyPressed) {
        if (keyCode == right) {
          //dx = 1;
          angle += 0.019;
        } else if (keyCode == left) {
          //dx = -1;
          angle -= 0.019;
        }

        // Движение вперед и назад
        if (keyCode == up) {
          //dy = -1;
          println("1");
          this.d += 0.01;
        } else if (keyCode == down) {
          this.d -= 0.01;
        }
      }
    }
    if (s == 'k') {
      if (keyPressed) {
        if (key == right) {
          //dx = 1;
          angle += 0.019;
        } else if (key == left) {
          //dx = -1;
          angle -= 0.019;
        }

        // Движение вперед и назад
        if (key == up) {
          //dy = -1;
          println("1");
          this.d += 0.01;
        } else if (key == down) {
          this.d -= 0.01;
        }
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
