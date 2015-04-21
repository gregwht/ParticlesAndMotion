
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

    // Calculate wind
    PVector wind = new PVector(0.011, 0);
    // Calculate gravity
    float m = mover[i].mass;
    PVector gravity = new PVector(0, 0.1 * m);
    // Calculate friction
    float c = 0.05;   // Coefficient of friction (stickiness of surface)
    PVector friction = mover[i].velocity.get();   // Copy velocity vector
    friction.mult(-1);   // Reverse the direction
    friction.normalize();  // Take away magnitude
    friction.mult(c);  // Calculate new magnitude

    mover[i].applyForce(friction);
    mover[i].applyForce(wind);
    mover[i].applyForce(gravity);
   
    
    mover[i].update();
    mover[i].checkEdges();
    mover[i].display();
  }
}

