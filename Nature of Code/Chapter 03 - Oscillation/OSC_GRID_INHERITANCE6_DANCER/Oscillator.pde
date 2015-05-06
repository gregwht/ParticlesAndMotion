class Oscillator {

  PVector angle;     // Use a PVector instead of a float
  PVector velocity;  // to track 2 angles (x, y)
  PVector amplitude;

  PVector pos;    // x, y pos of ball
  float prevX;  // Used to track when ball reaches top of oscillation

  float xVel;  // velocity of oscillator objects in x direction 
  float yVel;  // velocity of oscillator objects in y direction 

  float xAmp;
  float yAmp;


  Oscillator(float _xVel, float _yVel, float _xAmp, float _yAmp) {

    xVel = _xVel;
    yVel = _yVel;

    xAmp = _xAmp;
    yAmp = _yAmp;

    angle = new PVector();
    velocity = new PVector(xVel, yVel);  // Try messing with these numbers
    amplitude = new PVector(xAmp, yAmp);
    pos = new PVector();
  }


  void oscillate() {

    // println("prevX: " + prevX + "pos.x: " + pos.x);

    angle.add(velocity);

    // Store current pos.x as prevX
    prevX = pos.x;

    // Oscillate
    switch(key) {

    case '1':
      pos.x = sin(angle.x) * amplitude.x;
      pos.y = sin(angle.y) * amplitude.y;
      break;

    case '2':
      pos.x = sin(angle.x) * amplitude.x;
      pos.y = cos(angle.y) * amplitude.y;
      break;

    case '3':  
      pos.x = sin(angle.x) * amplitude.x;
      pos.y = tan(angle.y) * amplitude.y;
      break;  

    case '4': 
      pos.x = cos(angle.x) * amplitude.x;
      pos.y = sin(angle.y) * amplitude.y;
      break;

    case '5': 
      pos.x = cos(angle.x) * amplitude.x;
      pos.y = cos(angle.y) * amplitude.y;
      break;

    case '6': 
      pos.x = cos(angle.x) * amplitude.x;
      pos.y = tan(angle.y) * amplitude.y;
      break;

    case '7': 
      pos.x = tan(angle.x) * amplitude.x;
      pos.y = sin(angle.y) * amplitude.y;
      break;

    case '8':
      pos.x = tan(angle.x) * amplitude.x;
      pos.y = cos(angle.y) * amplitude.y;
      break;

    case '9':  
      pos.x = tan(angle.x) * amplitude.x;
      pos.y = tan(angle.y) * amplitude.y;
      break;

    default: 
      pos.x = cos(angle.x) * amplitude.x;
      pos.y = sin(angle.y) * amplitude.y;
    }
  }


  void display() {

    stroke(0, 255, 150);
    line(0, 0, pos.x, pos.y);
    noStroke();
    fill(255, 0, 150);
    ellipse(pos.x, pos.y, 6, 6);
  }

  // Getters
  float getX() {

    return xVel;
  }

  float getY() {

    return yVel;
  }

  // Setters
  void setX(float _xVel) {

    xVel = _xVel;
  }

  void setY(float _yVel) {

    yVel = _yVel;
  }
}

