Ship shipo = new Ship("ship_0.2.png", 100, 100);
Ship shipo2 = new Ship("ship_0.2.png", 50, 50);

void setup() {
  size(1900, 1000);
  frameRate(60);
  
//shipo("ship_0.2.png", 100, 100);
}

void draw() {
  background(0, 0, 0);




shipo.PostingImg();
shipo.Move(39, 37, 38, 40, 'd');

shipo2.PostingImg();
shipo2.Move(100, 97, 119, 115, 'k');
  

  //


  //выовд скорости
  textSize(20);
  text("Скорость " + (round(shipo.speed()*100)/100.0), 2, 22);
  text("м/с", 125, 22);
  
  //println(RIGHT); //39
  //println(LEFT); //37
  //println(DOWN); //40
  //println(int(UP)); //38
}
