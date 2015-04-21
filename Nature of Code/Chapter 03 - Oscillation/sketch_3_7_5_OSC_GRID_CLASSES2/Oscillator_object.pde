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

  void display(float offset) {

    // Gubbins
    for (int j = 0; j < rowLength; j++) {
      for (int i = 0; i < rowLength; i++) {

        float x = cos(angle.x) * amplitude.x;
        float y = sin(angle.y) * amplitude.y;

        // Go to (0, 0)
        pushMatrix();
        translate(width/2 - offset, height/2 - offset);   

        // Move up one unit, left one unit, draw matchstick
        stroke(0, 255, 150);
        line(0 + 40*i, 0 + 40*j, x + 40*i, y + 40*j);
        noStroke();
        fill(255, 0, 150);
        ellipse(x + 40*i, y + 40*j, 6, 6);

        popMatrix();
      }
    }
  }
}

