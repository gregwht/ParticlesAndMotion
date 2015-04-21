
Mover mover = new Mover();

void setup() {
  size(600, 300, P2D);
  background(255);
  mover = new Mover();
}


void draw() {
  //background(255);

  PVector wind = new PVector(0.01, 0);
  PVector gravity = new PVector(0, 0.1);
  mover.applyForce(wind);
  mover.applyForce(gravity);

  mover.update();
  mover.checkEdges();
  mover.display();
}

