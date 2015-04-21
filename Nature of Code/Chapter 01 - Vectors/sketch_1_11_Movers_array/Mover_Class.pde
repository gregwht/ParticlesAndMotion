class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  float topSpeed;

  PVector mouse;
  PVector dir;


  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001, 0.01);  // Values are small, but accumulate over each frame

    topSpeed = 8;
  }

  void update() {

    // 1. Calculate a vector that points from the object to the target location (mouse)
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);    
     
  
    // 2. Normalise that vector (reducing its length to 1)
    dir.normalize();
    // 3. Scale that vectorto an appropriate value 
    dir.mult(0.5);
    
    // 4. Assign that vector to acceleration
    acceleration = dir;


    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
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
}

