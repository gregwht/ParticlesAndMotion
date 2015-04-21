class Oscillator {

  PVector angle;    // Use a PVector instead of a float
  PVector velocity; // to track 2 angles (x, y)
  PVector amplitude;
  int rowLength;

  Oscillator(int row_) {

    angle = new PVector();
    //velocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05);
    velocity = new PVector(0.05, 0.05);
    amplitude = new PVector(20, 20);
    rowLength = row_;
  }

  void oscillate() {
    angle.add(velocity);
  }

  void display() {

    for (int i = 1; i < rowLength+1; i++) {
      
      float x = cos(angle.x) * amplitude.x;
      float y = sin(angle.y) * amplitude.y;

      pushMatrix();
      translate(width/2 + 40 * i, height/2 + 40 * i);
      stroke(0, 255, 150);
      fill(255, 0, 150);
      line(0, 0, x, y);
      noStroke();
      ellipse(x, y, 6, 6);
      popMatrix();
    }
  }
}

