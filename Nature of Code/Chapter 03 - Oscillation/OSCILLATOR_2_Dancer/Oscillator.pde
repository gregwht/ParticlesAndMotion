// -------------------------------------------------------------------------------
//
// NOTE: CODE WITHIN /***/ MARKERS HAS BEEN TAKEN FROM
//       'THE NATURE OF CODE' BY DANIEL SHIFFMAN
//       (CHAPTER 3.7 OSCILLATION WITH ANGULAR VELOCITY)
//
// -------------------------------------------------------------------------------


// This class creates oscillating particles
class Oscillator {

  // Since we have to calculate two values - an x and a y position - 
  // I am making extensive use of PVectors
  /***/
  PVector angle;     // The angle at which the particle will move
  PVector velocity;  // The speed at which the particle will move
  PVector amplitude; // The magnitude of the distance the particle will move
  /***/
  
  PVector pos;      // x and y position of particle

  // Oscillator constructor - requires:
  //  * x and y velocities
  //  * x and y amplitudes
  Oscillator(float _xVel, float _yVel, float _xAmp, float _yAmp) {

    // Initialise our vectors with the values passed in to the constructor
    /***/
    angle = new PVector();
    velocity = new PVector(_xVel, _yVel);
    amplitude = new PVector(_xAmp, _yAmp);
    pos = new PVector();
    /***/
  }

  // Oscillate the particle
  void oscillate() {

    /*
    
        This is the second key algorithm in my program,
        appropriated from Daniel Shiffman's 'The Nature of Code'
        (in Chapter 3.7 Oscillation with Angular Velocity).
        
        We use the algorithm to calculate the x and y position of the particle.
        
        First we need a slowly-increasing variable: for this we are using our
        PVector 'angle'. With each loop of the oscillate() function, we add 
        our velocity in the x and y direction to the angle vector.
       
        To find the x position, we simply calculate the sine, cosine, or tangent 
        of the angle.x, depending on which case we have chosen (explained below).
        To find the y position, we again find the sine / cosine / tangent, but of
        angle.y. The result of these calculations are multiplied by amplitude.x 
        and amplitude.y, respectively. 
        
        This algorithm is what produces the lovely, smooth motion. 
        By offsetting the start of each animation slightly, we are able to produce
        enchanting optical illusions and emergent visual patterns from a set of
        simple rules.   
    
    */
    
    
    // Add velocity vector to the angle vector
    /***/
    angle.add(velocity);
    /***/

    // To make it easier to change oscillation functions, I implemented a switch.
    // It reads key values, and matches the numbers 1-9 to a set of oscillation functions.
    // By default, the x position is calculated with a cosine function, 
    // and the y position is calculated with a sine function. 
    switch(key) {

    case '1':
      /***/
      pos.x = sin(angle.x) * amplitude.x;
      pos.y = sin(angle.y) * amplitude.y;
      /***/
      break;

    case '2':
      /***/
      pos.x = sin(angle.x) * amplitude.x;
      pos.y = cos(angle.y) * amplitude.y;
      /***/
      break;

    case '3':  
      /***/
      pos.x = sin(angle.x) * amplitude.x;
      pos.y = tan(angle.y) * amplitude.y;
      /***/
      break;  

    case '4': 
      /***/
      pos.x = cos(angle.x) * amplitude.x;
      pos.y = sin(angle.y) * amplitude.y;
      /***/
      break;

    case '5': 
      /***/
      pos.x = cos(angle.x) * amplitude.x;
      pos.y = cos(angle.y) * amplitude.y;
      /***/
      break;

    case '6': 
      /***/
      pos.x = cos(angle.x) * amplitude.x;
      pos.y = tan(angle.y) * amplitude.y;
      /***/
      break;

    case '7': 
      /***/
      pos.x = tan(angle.x) * amplitude.x;
      pos.y = sin(angle.y) * amplitude.y;
      /***/
      break;

    case '8':
      /***/
      pos.x = tan(angle.x) * amplitude.x;
      pos.y = cos(angle.y) * amplitude.y;
      /***/
      break;

    case '9':
      /***/  
      pos.x = tan(angle.x) * amplitude.x;
      pos.y = tan(angle.y) * amplitude.y;
      /***/
      break;

    default: 
      /***/
      pos.x = cos(angle.x) * amplitude.x;
      pos.y = sin(angle.y) * amplitude.y;
      /***/
    }
  }


  void display() {

    stroke(0, 255, 150);            // Set stroke colour to a nice candy green
    line(0, 0, pos.x, pos.y);       // Draw a line from the particle's origin to it's current position
                                    // !!! Commenting out this line can create a sense of depth,
                                    // !!! especially when using case '2' or '4'.
    noStroke();                     // We don't want to particles to have a stroke
    fill(255, 0, 150);              // Fill the particles with a hot pink
    ellipse(pos.x, pos.y, 6, 6);    // Draw the particles at current position
  }

// Getters
  float getX() {

    return velocity.x;
  }

  float getY() {

    return velocity.y;
  }

  // Setters
  void setX(float _xVel) {

    velocity.x = _xVel;
  }

  void setY(float _yVel) {

    velocity.y = _yVel;
  }
}
