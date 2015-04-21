Ball[] b = new Ball[25];

void setup() {

  size(600, 600);
  background(255);
  smooth();
  
  for (int i = 1; i < 6; i++) {
    for (int j = 1; j < 6; j++) {
      
      b[i] = new Ball(i * 100, j * 100, 75, 0);
    }
  }
  
}

void draw() { 

  background(255);  

  for (int i = 1; i < 6; i++) {
    for (int j = 1; j < 6; j++) {

      b[i] = new Ball(i * 100, j * 100, b[i].r, b[i].theta);

      b[i].update();
      b[i].display();
    }
  }
  
}

