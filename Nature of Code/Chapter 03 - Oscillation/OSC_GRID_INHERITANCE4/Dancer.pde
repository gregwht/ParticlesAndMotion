class Dancer extends Oscillator {  

  float bpm;  // Beats per minute
  float bpb;  // Beats per bar

  Dancer(float _xVel, float _yVel, float _xAmp, float _yAmp) {

    super(_xVel, _yVel, _xAmp, _yAmp);
  }

  void oscillate(float _bpm, float _bpb) {

    bpm = _bpm;
    bpb = _bpb;
    
    //    getBpm(bpm);
    //    getBpb(bpb);

    float xVel = getX();
    xVel = (bpb/2)/10;
    // We want an oscillation per bar:

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
    pos.x = sin(angle.x) * amplitude.x;
    //pos.x = cos(angle.x) * amplitude.x;
    //pos.x = tan(angle.x) * amplitude.x;

    pos.y = sin(angle.y) * amplitude.y;
    //pos.y = cos(angle.y) * amplitude.y;
    //pos.y = tan(angle.y) * amplitude.y;
  }

//float getBpm(float _bpm) {
//
//  bpm = _bpm;
//  //println("bpm: " + bpm);    
//  return bpm;
//}
//
//int getBpb(int _bpb) {
//
//  bpb = _bpb;
//  //println("bpb: " + bpb);
//  return bpb;
//}

}
