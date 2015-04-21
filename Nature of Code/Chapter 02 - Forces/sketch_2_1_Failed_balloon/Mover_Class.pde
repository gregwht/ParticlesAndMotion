class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  float topSpeed;

  Mover() {
    location = new PVector(width/2, (height/3) * 2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, -0.01);
    topSpeed = 3;
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

    if (location.x > width || location.x < 0) {
      acceleration.x *= -1;
    }
    
    if (location.y > height || location.y < 0) {
      
      acceleration.y *= -1.99;
    }
    
  }

}
