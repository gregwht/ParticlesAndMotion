Mover balloon;

void setup() {

  size(400, 400);
  background(255);
  balloon = new Mover();
}

void draw() {
  background(255);
  balloon.update();
  balloon.checkEdges();
  balloon.display();
}

