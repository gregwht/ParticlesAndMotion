Walker w;

void setup(){
 
  size(640, 360);
  background(255);
  
  w = new Walker();
}

void draw() {
  
  w.step();
  w.display();
}
