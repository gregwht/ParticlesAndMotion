class Dancer extends Oscillator {  

  float bpm;  // Beats per minute
  float bpb;  // Beats per bar

  Dancer(float _xVel, float _yVel, float _xAmp, float _yAmp) {

    super(_xVel, _yVel, _xAmp, _yAmp);
  }

  void oscillate(float _bpm, float _bpb) {

    bpm = _bpm;
    bpb = _bpb;

    float xVel = getX();
    //xVel = (bpb/2)/10;
    xVel = ((60/bpm) * bpb)/10;
    // We want an oscillation per bar:
    // We divide 60(seconds) by the number of beats per minute, 
    // to get the time duration of each beat.
    // We then multiply this by the number of beats in a bar.

    float yVel = getY();
    yVel = ((bpm / 60)/2)/10;

    // We want half an oscillation per beat:
    // Tempo/60 to get beats per second
    // beats per second / 2 to get half an oscillation
    // Divide by 10 or 100 to reduce scale

    println("x: " + xVel + " y: " + yVel);

    velocity.x = xVel;
    velocity.y = yVel; 

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
}

