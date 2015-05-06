class Oscillator {

  PVector angle;    // Use a PVector instead of a float
  PVector velocity; // to track 2 angles (x, y)
  PVector amplitude;

  Oscillator() {

    angle = new PVector();
    //velocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05);
    velocity = new PVector(0.05, 0.05);
    amplitude = new PVector(20, 20);
  }

  void oscillate() {
    angle.add(velocity);
  }

  void display(float xOffset, float yOffset) {
    float x = cos(angle.x) * amplitude.x;
    float y = sin(angle.y) * amplitude.y;
    
    pushMatrix();
    translate(xOffset, yOffset);
    stroke(0, 255, 150);
    fill(255, 0, 150);
    line(0, 0, x, y);
    noStroke();
    ellipse(x, y, 6, 6);
    popMatrix();
  }
}

