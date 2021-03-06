class OscRing {

  Oscillator[] osc = new Oscillator[15*15];

  int rNum;  // Number of matchstick rows
  int cNum;  // Number of matchstick columns

  float space;   // Space between matchsticks

  OscRing(int _rNum, int _cNum) {

    rNum = _rNum;
    cNum = _cNum;

    space = 40;


    // Create 15x15 grid of Oscillators
    for (int i = 0; i < rNum * cNum; i++) { 
      osc[i] = new Oscillator();
    }
  }


  void oscillate(int preDelay) {

    if (millis() >= preDelay){
      for (int r = 0; r < rNum; r++)
      {
          osc[r].oscillate();
      }
    }
  }
  
  void delayCheck(int delay) {
   
    for (int r = 0; r < rNum; r++)
    {
      if (osc[0].prevX < 0 && osc[0].pos.x > 0) 
      {
        delay(delay);
      }
    }
  }

  void display() {

    for (int r = 0; r < rNum; r++)
    {
      // Draw first row
      if (r == 0)
      {
        for (int c = 0; c < cNum; c++)
        {
          pushMatrix();
            translate(width/2 /* to centre*/ - (space * ((rNum-1)/2)) /*to top left corner*/ + (c * space) /* individual matches*/,
                      height/2 /* to centre*/ - (space * ((cNum-1)/2)));
            osc[c].display();
          popMatrix();
        }
      }
      // Draw last row
      else if (r == rNum-1)
      {
        for (int c = 0; c < cNum; c++)
        {
          pushMatrix();
            translate(width/2 - (space * ((rNum-1)/2)) /* to top left corner*/ + (c * space) /* individual matches */, 
                      height/2 + (space * ((cNum-1)/2)));
            osc[c].display();
          popMatrix();
        }
      }
      // Draw columns
      else 
      {
        for (int c = 0; c < cNum; c++)
        {
          // Draw first column
          if (c == 0)
          {
          pushMatrix();
            translate(width/2 - (space * ((rNum-1)/2)) /* to centre*/ + (c * space) /* individual matches */ ,
                      height/2 - (space * ((cNum-1)/2)) /*To get to left hand corner */ + (r * space) /*individual matches*/);
            osc[c].display();
          popMatrix();
          }
          // Draw last column
          if (c == cNum-1)
          {
          pushMatrix();
            translate(width/2 - (space * ((rNum-1)/2)) /* to centre*/ + (c * space) /* individual matches */ ,
                      height/2 - (space * ((cNum-1)/2)) /*To get to left hand corner */ + (r * space) /*individual matches*/);
            osc[c].display();
          popMatrix();
          }
        }
      }
    }
    
  }  // End void display();
  
}  // End class

