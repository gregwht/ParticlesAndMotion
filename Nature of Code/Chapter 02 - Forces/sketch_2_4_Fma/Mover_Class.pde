class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  float mass;

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(-3.001, 5.01);  // Values are small, but accumulate over each frame
    mass = 10.0;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);      // Clear acceleration back to 0 each frame
  }

  void display() {
    smooth();
    stroke(255);
    fill(255, 0, 150);
    ellipse(location.x, location.y, 16, 16);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }


  void applyForce(PVector force) {

    PVector f = force.get();   // Get a copy of "force" and store it in PVector "f"
    force.div(mass);           // a = f/m (Newton's 2nd law)
    acceleration.add(force);   // .add(force) allows for addition of multiple forces (gravity, wind, etc.)
  }
}

