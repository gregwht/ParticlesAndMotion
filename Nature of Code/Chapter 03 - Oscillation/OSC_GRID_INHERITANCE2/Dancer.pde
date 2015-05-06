class Dancer extends Oscillator {

  float bpm;  // Beats per minute
  int bpb;  // Beats per bar

  Dancer(float _xVel, float _yVel, float _xAmp, float _yAmp) {

    super(_xVel, _yVel, _xAmp, _yAmp);
    
  }

  void oscillate() {

    getBpm();
    getBpb();

    float xVel = getX();
    xVel = bpb/10;

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
    pos.x = cos(angle.x) * amplitude.x;
    pos.y = sin(angle.y) * amplitude.y;
  }

  float getBpm() {

    bpm = 120;
    return bpm;
  }

  int getBpb() {

    bpb = 4;
    return bpb;
  }
}
