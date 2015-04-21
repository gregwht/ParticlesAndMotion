Mover[] m = new Mover[10];
Attractor a;

void setup() {
  size(600, 600, P2D);
  background(255);

  // Initialise objects

  for (int i = 0; i < m.length; i++) {
    m[i] = new Mover(random(0.1, 2), random(width), random(height));
  }
  a = new Attractor(30, 0.4);
}

void draw() {
  background(255);

  a.display();
  
  for (int i = 0; i < m.length; i++) {
    // Calculate attraction force
    PVector f = a.attract(m[i]);
    m[i].applyForce(f);  // Apply force to mover
    m[i].update();
    m[i].display();
  }
}

