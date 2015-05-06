class Oscillator {

  PVector angle;     // Use a PVector instead of a float
  PVector velocity;  // to track 2 angles (x, y)
  PVector amplitude;

  PVector pos;    // x, y pos of ball
  float prevX;  // Used to track when ball reaches top of oscillation

  float xVel;  // velocity of oscillator objects in x direction 
  float yVel;  // velocity of oscillator objects in y direction 


  Oscillator(float _xVel, float _yVel) {

    xVel = _xVel;
    yVel = _yVel;
    
    angle = new PVector();
    velocity = new PVector(xVel, yVel);  // Try messing with these numbers
    amplitude = new PVector(20, 20);
    pos = new PVector();
  }


  void oscillate() {

   // println("prevX: " + prevX + "pos.x: " + pos.x);

    angle.add(velocity);

    // Store current pos.x as prevX
    prevX = pos.x;

    // Oscillate
    pos.x = cos(angle.x) * amplitude.x;
    pos.y = sin(angle.y) * amplitude.y;
  }

  
  void display() {
   
    stroke(0, 255, 150);
    line(0, 0, pos.x, pos.y);
    noStroke();
    fill(255, 0, 150);
    ellipse(pos.x, pos.y, 6, 6);
     
  }
  
  
}

