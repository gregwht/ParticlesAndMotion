Mover[] m = new Mover[20];

void setup() {
  size(600, 600, P2D);
  background(255);

  // Initialise objects
  for (int i = 0; i < m.length; i++) {
    m[i] = new Mover(random(0.1, 2), random(width), random(height));
  }
}

void draw() {
  background(255);

  for (int i = 0; i < m.length; i++) {
    for (int j = 0; j < m.length; j++) {
      if (i != j) {   // Don't attract yourself
        PVector force = m[j].attract(m[i]);
        m[i].applyForce(force);
      }
    }
    m[i].update();
    m[i].display();
  }
}

