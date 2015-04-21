Mover m;
Attractor a;

void setup() {
  size(600, 600, P2D);
  background(255);

  // Initialise objects
  m = new Mover(1.0);
  a = new Attractor(20, 0.4);
}

void draw() {
  background(255);

  // Calculate attraction force
  PVector f = a.attract(m);
  m.applyForce(f);  // Apply force to mover
  m.update();
  
  a.display();
  m.display();
}

