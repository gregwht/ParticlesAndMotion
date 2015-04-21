class Oscillator {

  PVector angle;    // Use a PVector instead of a float
  PVector velocity; // to track 2 angles (x, y)
  PVector amplitude;

  // x,y pos of ball
  PVector pos;
  float prevX;      // Used to track when a whole circular oscillation is complete

  Oscillator() {

    angle = new PVector();
    //velocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    velocity = new PVector(0.05, 0.05);
    amplitude = new PVector(20, 20);

    pos = new PVector();
  }

  void oscillate(int preDelay) {
   
    println("prevX: " + prevX + " pos.x: " + pos.x);

    angle.add(velocity);

    // Store current pos.x as prevX
    prevX = pos.x;
    
    // Oscillate 
    pos.x = cos(angle.x) * amplitude.x;
    pos.y = sin(angle.y) * amplitude.y;


    if (prevX < 0 && pos.x > 0) { 
      delay(preDelay);
    }
    
  }

  void display(int rNum, int cNum, int offset) {

    for (int r = 0; r < rNum; r++) {

      // Draw ring of matchsticks
      // 1. Draw top and bottom lines
      if (r == 0 || r == rNum-1) {
        for (int c = 0; c < cNum; c++) {
          pushMatrix();
          translate(offset, offset);    // Adjust for a nice border around the edge
          stroke(0, 255, 150);
          line(0 + 40*c, 0 + 40*r, pos.x + 40*c, pos.y + 40*r);
          noStroke();
          fill(255, 0, 150);
          ellipse(pos.x + 40*c, pos.y + 40*r, 6, 6);
          popMatrix();
        }
      }
      // 2. Draw the first and last matchsticks of the other rows
      else {
        pushMatrix();
        translate(offset, offset);
        stroke(0, 255, 150);
        line(0, 0 + 40*r, pos.x, pos.y + 40*r);
        line(0+ 40*(rNum-1), 0 + 40*r, pos.x + 40*(rNum-1), pos.y + 40*r);
        noStroke();
        fill(255, 0, 150);
        ellipse(pos.x, pos.y + 40*r, 6, 6);
        ellipse(pos.x + 40*(rNum-1), pos.y + 40*r, 6, 6);
        popMatrix();
      }
    }
  }
}

