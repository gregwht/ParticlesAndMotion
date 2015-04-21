
Mover john;

void setup(){
  size(600,600);
  background(255);
  john = new Mover();
}


void draw(){
  background(255);
  john.update();
  john.checkEdges();
  john.display();
}
