class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  float mass;
  float radius;

  Mover(float m, float x, float y) {
   
    mass = m;
    radius = mass*16;
    
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);  // Values are small, but accumulate over each frame
   
    
  }

void applyForce(PVector force) {

    PVector f = force.get();   // Get a copy of "force" and store it in PVector "f"
    f.div(mass);           // a = f/m (Newton's 2nd law)
    acceleration.add(f);   // .add(force) allows for addition of multiple forces (gravity, wind, etc.)
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    
    acceleration.mult(0);      // Clear acceleration back to 0 each frame
  }

  void display() {
    smooth();
//    noStroke();
    stroke(255);
    fill(255, 0, 150);
    ellipse(location.x, location.y, radius, radius);
  }

  void checkEdges() {

    if (location.x > width - radius/2) {
      location.x = width - radius/2;
      velocity.x *= -1;
    } else if (location.x <= 0 + radius/2) {
      velocity.x *= -1;
      location.x = 0 + radius/2;
    }

    if (location.y >= height - radius/2) {
      velocity.y *= -1;
      location.y = height - radius/2;
    } else if (location.y <= 0 + radius/2) {
      velocity.y *= -1;
      location.y = 0 + radius/2;
    }
  }
}

