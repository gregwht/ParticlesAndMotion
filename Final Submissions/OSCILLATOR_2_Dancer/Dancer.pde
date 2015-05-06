// This class extends the Oscillator class
class Dancer extends Oscillator {  

  float bpm;  // Beats per minute
  float bpb;  // Beats per bar

  // Dancer constructor - requires:
  //  * x and y velocities
  //  * x and y amplitudes
  Dancer(float _xVel, float _yVel, float _xAmp, float _yAmp) {

    // Inherit values from Oscillator class
    super(_xVel, _yVel, _xAmp, _yAmp);
  }

  // Oscillate the particle
  void oscillate(float _bpm, float _bpb) {

    // Set bpm and bpb to incoming values
    bpm = _bpm;
    bpb = _bpb;

    // Get velocity.x and set it to a value called xVel
    float xVel = getX();
    xVel = ((60/bpm) * bpb)/10;
    // We want an oscillation per bar:
    // We divide 60(seconds) by the number of beats per minute, 
    // to get the time duration of each beat.
    // We then multiply this by the number of beats in a bar.
    // We divide the final result by 10 to scale it down.


    // Get velocity.y and set it to a value called yVel
    float yVel = getY();
     yVel = ((bpm / 60)/2)/10;
    // We want half an oscillation per beat:
    // Tempo/60 to get beats per second
    // beats per second / 2 to get half an oscillation
    // Divide by 10 or 100 to reduce scale

    // Add the calculated values to our velocity vector
    velocity.x = xVel;
    velocity.y = yVel; 

    // See Oscillator class for detailed explanation of oscillation process
    angle.add(velocity);
    
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
    } // End switch
  } // End oscillate() method
} // End dancer class

