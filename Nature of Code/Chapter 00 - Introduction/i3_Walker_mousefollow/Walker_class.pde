class Walker {

  int x;
  int y;


  Walker() {

    x = width/2;
    y = height/2;
  }


  void display() {

    stroke(0);
    point(x, y);
  }


  void step() {

    float r = random(1);
    
    if (r < 0.125){
      x++;
    } else if (r < 0.25) {
      x--;
    } else if (r < 0.375) {
      y++;
    } else if (r < 0.5){
      y--;
    } else {
      
      if (x < mouseX){
        x++;
      } else {
        x--;
      }
      
      if (y < mouseY){
        y++;
      } else {
        y--;
      }
    }
    
    
  }
}

