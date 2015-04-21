class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  float topSpeed;

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.001, 0.01);  // Values are small, but accumulate over each frame
    topSpeed = 10;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }

  void display() {
    noStroke();
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

