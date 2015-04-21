class Oscillator {

  PVector angle;    // Use a PVector instead of a float
  PVector velocity; // to track 2 angles (x, y)
  PVector amplitude;

  Oscillator() {

    angle = new PVector();
    //velocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05);
    velocity = new PVector(0.02, 0.04);
    amplitude = new PVector(random(width/2), random(height/2));
  }

  void oscillate() {
    angle.add(velocity);
  }

  void display() {
    float x = sin(angle.x) * amplitude.x;
    float y = sin(angle.y) * amplitude.y;
    
    pushMatrix();
    translate(width/2, height/2);
    stroke(0);
    fill(255, 0, 150);
    line(0, 0, x, y);
    //noStroke();
    ellipse(x, y, 16, 16);
    popMatrix();
  }
}

