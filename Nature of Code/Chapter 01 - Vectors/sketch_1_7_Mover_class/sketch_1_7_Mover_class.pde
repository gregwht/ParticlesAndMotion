
Mover john;

void setup(){
  size(200, 200);
  background(255);
  john = new Mover();
}


void draw(){
  background(255);
  john.update();
  john.checkEdges();
  john.display();
}
