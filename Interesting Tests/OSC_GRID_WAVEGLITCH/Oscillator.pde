class Oscillator {

  PVector angle;     // Use a PVector instead of a float
  PVector velocity;  // to track 2 angles (x, y)
  PVector amplitude;

  PVector pos;    // x, y pos of ball
  float prevX;  // Used to track when ball reaches top of oscillation

  Oscillator() {

    angle = new PVector();
    velocity = new PVector(0.05, 0.05);
    amplitude = new PVector(20, 20);
    pos = new PVector();
  }

// Default oscillate method (no delay)
  void oscillate() {

   // println("prevX: " + prevX + "pos.x: " + pos.x);

    angle.add(velocity);

    // Store current pos.x as prevX
    prevX = pos.x;

    // Oscillate
    pos.x = cos(angle.x) * amplitude.x;
    pos.y = sin(angle.y) * amplitude.y;
  }
  
// Oscillate method with delay
  void oscillate(int delay) {

   // println("prevX: " + prevX + "pos.x: " + pos.x);

    angle.add(velocity);

    // Store current pos.x as prevX
    prevX = pos.x;

    // Oscillate
    pos.x = cos(angle.x) * amplitude.x;
    pos.y = sin(angle.y) * amplitude.y;

    // If ball is at the top, pause for a moment
    if (prevX < 0 && pos.x > 0) {
      delay(delay);
    }
  }
  
  void display() {
   
    stroke(0, 255, 150);
    line(0, 0, pos.x, pos.y);
    noStroke();
    fill(255, 0, 150);
    ellipse(pos.x, pos.y, 6, 6);
     
  }
  
  
}

