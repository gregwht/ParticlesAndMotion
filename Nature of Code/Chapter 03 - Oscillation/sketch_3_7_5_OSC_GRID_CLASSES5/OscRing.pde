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
int space;  // Space between matchsticks

  OscRing(int _rNum, int _cNum, int _offset, int _delay) {

    rNum = _rNum;
    cNum = _cNum;
    offset = _offset;
    
    // Create 15x15 grid of Oscillators
    for (int i = 0; i < rNum * cNum; i++) { 
      osc[i] = new Oscillator();
    }
    
    
  }
  
  
  void oscillate()  {
   
   for (int r = 0; r < rNum; r++)
   {
     for (int c = 0; c < cNum; c++)
     {
       osc[c].oscillate();
     }
   }  
     
    
  }


  void display() {

    for (int r = 0; r < rNum; r++) 
    {
      // Draw all matchsticks of top and bottom rows
      if (r == 0 || r == rNum-1) 
      {
        for (int c = 0; c < cNum; c++)
        {
          pushMatrix();
          
            // Offset to top-left corner of ring as 0,0
            translate(offset, offset);  // Adjust for a nice border around the edge
             
             osc[c].display();
//            // Draw lines to ball position          
//            stroke(0, 255, 150);
//            line( 0 + (space * c), 0 + (space * r), osc[c].pos.x + (space * c), osc[c].pos.y + space * r);
//            
//            // Draw balls
//            noStroke();
//            fill(255, 0, 150);
//            ellipse(osc[c].pos.x + (space * c), osc[c].pos.y + (space * r), 6, 6);
//            
          popMatrix();
        }
      }
      // Draw first and last matchsticks of the other rows
      else
      { 
       for (int c = 0; c < cNum; c++)
        { 
          pushMatrix();
          
            translate(offset, offset);
            
            osc[c].display();
            
//            stroke(0, 255, 150);
//            // First matchstick
//            line(0, 0 + (space * r), osc[c].pos.x, osc[c].pos.y + (space * r));
//            // Last matchstick
//            line(0 + (space * (rNum - 1)), 0 + (space * r), osc[c].pos.x + (space * (rNum-1)), osc[c].pos.y + (space * r));
//            
//            noStroke();
//            fill(255, 0, 150);
//            // First ball
//            ellipse(osc[c].pos.x, osc[c].pos.y + (space * r), 6, 6);
//            // Last ball
//            ellipse(osc[c].pos.x + (space * (rNum - 1)), osc[c].pos.y + (space * r), 6, 6);

          popMatrix();
        }
      }
    }
    
    
  }
  
}

