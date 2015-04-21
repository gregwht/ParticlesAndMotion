class Oscillator {

  PVector angle;    // Use a PVector instead of a float
  PVector velocity; // to track 2 angles (x, y)
  PVector amplitude;
  float prevX;      // Used to track when a whole circular oscillation is complete
  
  Oscillator() {

    angle = new PVector();
    //velocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    velocity = new PVector(0.05, 0.05);
    amplitude = new PVector(20, 20);
  }

  void oscillate() {
    
    angle.add(velocity);
  }

  void display() {
   
  }
  
  void calculate(int rNum, int cNum, int offset, int delay){
    for (int r = 0; r < rNum; r++) {
      
      
      // Oscillate 
      float x = cos(angle.x) * amplitude.x;
      float y = sin(angle.y) * amplitude.y;
 
      println("x: " + x + "  y: " + y);
      
      if (prevX < 0 && x > 0){
        delay(1000 - delay);
      }
      
      // Draw ring of matchsticks
      // 1. Draw top and bottom lines
      if (r == 0 || r == rNum-1) {
        for (int c = 0; c < cNum; c++) {
          pushMatrix();
          translate(offset, offset);    // Adjust for a nice border around the edge
          stroke(0, 255, 150);
          line(0 + 40*c, 0 + 40*r, x + 40*c, y + 40*r);
          noStroke();
          fill(255, 0, 150);
          ellipse(x + 40*c, y + 40*r, 6, 6);
          popMatrix();
        }
      }
      // 2. Draw the first and last matchsticks of the other rows
      else{
        pushMatrix();
        translate(offset, offset);
        stroke(0, 255, 150);
        line(0, 0 + 40*r, x, y + 40*r);
        line(0+ 40*(rNum-1), 0 + 40*r, x + 40*(rNum-1), y + 40*r);
        noStroke();
        fill(255, 0, 150);
        ellipse(x, y + 40*r, 6, 6);
        ellipse(x + 40*(rNum-1), y + 40*r, 6, 6);
        popMatrix();
      }
        prevX = x;
    }
  }
}

