Mover[] m = new Mover[25];
Attractor[] a = new Attractor[2];

void setup() {
  size(500, 500, P2D);
  background(255);

  // Initialise objects
  for (int i = 0; i < m.length; i++) {
    m[i] = new Mover(random(0.1, 2), random(width), random(height));
  }

  for (int j = 0; j < a.length; j++) {
    a[0] = new Attractor(25, 0.4, (width/4)*1, height/2);
    a[1] = new Attractor(25, 0.4, (width/4)*3, height/2);
  }
}

void draw() {
  background(255);



  for (int i = 0; i < m.length; i++) {
    for (int j = 0; j < a.length; j++) {

      // Hide attractors when mouse pressed
      if (!mousePressed) {
        a[j].display();
      }

      // Calculate attraction force
      PVector f = a[j].attract(m[i]);
      m[i].applyForce(f);  // Apply force to mover
      m[i].update();
      m[i].display();
    }
  }
}

