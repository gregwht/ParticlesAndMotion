
Mover[] mover = new Mover[50];
Liquid liquid; 

void setup() {
  size(600, 800, P2D);
  background(255);

  // Initialise movers
  for (int i = 0; i < mover.length; i++) {
    mover[i] = new Mover(random(0.1, 5), random(0, width), 0);
  }

  // Initialise liquid
  liquid = new Liquid(0, (height/2), width, (height), 0.1);
}


void draw() {
  background(255);

  liquid.display();

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

    // Apply forces
    mover[i].applyForce(friction);
    mover[i].applyForce(wind);
    mover[i].applyForce(gravity);
  
    if (mover[i].isInside(liquid)) {
      mover[i].drag(liquid);
    }

    // Draw
    mover[i].update();
    mover[i].checkEdges();
    mover[i].display();
  }
}

