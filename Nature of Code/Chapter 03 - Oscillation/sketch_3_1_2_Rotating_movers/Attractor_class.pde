class Attractor {

  float mass;
  PVector location;
  float gravity;

  Attractor(float m, float g, float x, float y) {

    location = new PVector(x, y);
    mass = m;
    gravity = g;
  }


  PVector attract(Mover m) {

    // Calculate direction of force
    PVector force = PVector.sub(location, m.location); 
    float distance = force.mag();  // Store magnitude before normalizing as distance is required for formula below
    distance = constrain(distance, 5, 25); // Constrain so we don't have to divide by 0 or very small numbers like 0.001
    
    force.normalize();  // Now we have the direction

    // Calculate magnitude of force
    float strength = (gravity * mass * m.mass) / (distance * distance);  // (Gravitational force * mass of object 1 * mass or object 2) / Distance squared
    force.mult(strength);  // Now we have direction and magnitude

    return force;
  }


  void display() {

    stroke(255);
    fill(0, 255, 150, 100);
    ellipse(location.x, location.y, mass * 2, mass * 2);
  }
}

