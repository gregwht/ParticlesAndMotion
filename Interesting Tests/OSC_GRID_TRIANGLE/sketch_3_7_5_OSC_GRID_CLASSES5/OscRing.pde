class OscRing {

  // I want OscRing to create a ring of Oscillator objects
  // I want to be able to control the length of the ring (row, column)
  // Each ring has to have a different offset depending on its size
  // I want to be able to control the delay in oscillation
  
Oscillator[] osc = new Oscillator[15*15];

int rNum;
int cNum;
int offset;
int delay;

  OscRing(int _rNum, int _cNum, int _offset, int _delay) {

    rNum = _rNum;
    cNum = _cNum;
    offset = _offset;
    
    for (int r = 0; r < rNum * cNum; r++) { 
      osc[r] = new Oscillator();
    }
    
    
  }


  void display() {

    for (int r = 0; r < rNum * cNum; r++) {
      // Top and bottom lines
      if (r == 0 || r == rNum-1) {
      }
    }
  }
}

