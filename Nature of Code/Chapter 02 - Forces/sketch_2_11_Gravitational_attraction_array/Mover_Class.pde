class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  float radius;

  Mover(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001, 0.01);  // Values are small, but accumulate over each frame
    
    mass = m;
   radius = mass * 16;
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
    ellipse(location.x, location.y, radius, radius);
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

    acceleration.add(force);   // .add(force) allows for addition of multiple forces (gravity, wind, etc.)
  }
}

