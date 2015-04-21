
Mover[] mover = new Mover[100];

void setup() {
  size(600, 300, P2D);
  background(255);

  for (int i = 0; i < mover.length; i++) {
    mover[i] = new Mover(random(0.1, 5), 0, 0);
  }
}


void draw() {
  background(255);

  for (int i = 0; i < mover.length; i++) {

    PVector wind = new PVector(0.001, 0);

    float m = mover[i].mass;
    PVector gravity = new PVector(0, 0.1 * m);

    mover[i].applyForce(wind);
    mover[i].applyForce(gravity);

    mover[i].update();
    mover[i].checkEdges();
    mover[i].display();
  }
}

