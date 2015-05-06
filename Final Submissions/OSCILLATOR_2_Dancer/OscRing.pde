// This class creates rings of Oscillator objects
class OscRing {

  // Create a 15x15 array of Dancer objects
  // (15x15 is the largest size we will be using)
  Dancer[] osc = new Dancer[15*15];

  int rNum;  // Number of matchstick rows
  int cNum;  // Number of matchstick columns

  // Oscillator ring constructor - requires:
  //  * Space between particles
  //  * Number of rows
  //  * Number of columns
  //  * x and y velocities
  //  * x and y amplitudes
  OscRing(float _space, int _rNum, int _cNum, float _xVel, float _yVel, float _xAmp, float _yAmp) {

    // Set values to those passed through at initialisation 
    space = _space;   
    rNum = _rNum;
    cNum = _cNum;

    // Create grid of Oscillator objects, passing velocities and amplitudes
    for (int i = 0; i < rNum * cNum; i++) {  
      osc[i] = new Dancer(_xVel, _yVel, _xAmp, _yAmp);
    }

  } // End constructor
  
  
  // Oscillate the rings according to bpm and bpb
  void oscillate(int preDelay, float _bpm, float _bpb) {

    if (millis() >= preDelay) {
      for (int r = 0; r < rNum; r++)
      {
        osc[r].oscillate(_bpm, _bpb);
      }
    }
  } // End oscillate() method


  // Display the Oscillator rings
  void display() {

    
    /*
    
       This was one of the main challenges of my project: 
       to produce an algorithm that would display a grid of particles organised in rings,
       allowing me to shift the timing of each ring so as to create patterns / optical illusions. 
       
       The timing has been taken care of above, with the preDelay: 
       after a certain amount of time has passed, draw the next ring.
       All I had to do next was figure out how to draw in rings.
       
       First of all, here is the process in pseudocode:
       
       For each particle {
           
           if (first row) {
             for (each column) {
               calculate position of particle
               display
             }
           }
           
           else if (last row) {
             for (each column) {
               calculate position of particle
               display
             }
           }
           
           else {
             if (first column) {
               calculate position of particle
               display
             }
           
             if (last column) {
               calculate position of particle
               display
             }
           }
         }
      
       Here is a more detailed breakdown of the process:
       1*  For each ring, draw the first row of particles.
        
          This is achieved by translating the origin of each particle, calculating the distance thusly:
          
          X POSITION:
          - Get the number of columns in the ring                     (cNum-1)
          - Divide this number by two                                 (cNum-1)/2
          - Multiply this number by our space value                   space * ((rNum-1)/2)
          - Subtract the result from the centre of the screen         width/2 - (space * ((rNum-1)/2)  
          
         Now we are at the left edge of the ring. From here, all we need to do is add space * the number 
         of the column in which the particle is going to be displayed:  
         
          -  width/2 - (space * ((cNum-1)/2) + (c * space) 
          
          Y POSITION:
          Calculating the Y position is done in the same way, 
          except using the number of rows rather than columns,
          and subtracting the result from height/2 rather than width/2.
          As all particles are drawn at this height, 
          we don't need to worry about adding space * columns:
          
          - height/2 - (space * (rNum-1/2))
          
       2* For each ring, draw the last row of particles.
       
         This is achieved in much the same way as above, with one difference:
         When calculating the Y position, we add (space * ((rNum-1)/2)) to the
         centre of the screen, instead of subtract:
         
         - height/2 + (space * ((rNum-1)/2))
         
       3* For each ring, draw the first and last column of the remaining rows. 
       
         This is achieved first checking if the current column is the first, or last.
         If so, we find the x and y position as above. But this time, we add (r * space)
         to the y position.
          
         - height/2 - (space * ((rNum-1)/2)) + (r * space)      
         
    */
    
    
    for (int r = 0; r < rNum; r++)
    {
      // --- Draw rows
      
      // Draw first row
      if (r == 0)
      {
        for (int c = 0; c < cNum; c++)
        {
          pushMatrix();
          translate(width/2 /* to centre */ - (space * ((cNum-1)/2)) /* to left edge */ + (c * space) /* to column */, 
                   height/2 /* to centre */ - (space * ((rNum-1)/2)) /* to row */ );
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
          translate(width/2 /* to centre */ - (space * ((cNum-1)/2)) /* to left edge */ + (c * space) /* to column */, 
                   height/2 /* to centre */ + (space * ((rNum-1)/2)) /* to row */ );
          osc[c].display();
          popMatrix();
        }
      }
      
      
      // --- Draw columns
      
      else 
      {
        for (int c = 0; c < cNum; c++)
        {
          
          // Draw first column
          if (c == 0)
          {
            pushMatrix();
            translate(width/2 /* to centre */ - (space * ((cNum-1)/2)) /* to left edge */ + (c * space) /* to column */, 
                     height/2 /* to centre */ - (space * ((rNum-1)/2)) /* to top edge */  + (r * space) /* to row */ );
            osc[c].display();
            popMatrix();
          }
          
          
          // Draw last column
          if (c == cNum-1)
          {
            pushMatrix();
            translate(width/2 /* to centre */ - (space * ((cNum-1)/2)) /* to left edge */ + (c * space) /* to column */, 
                     height/2 /* to centre */ - (space * ((rNum-1)/2)) /* to top edge */  + (r * space) /* to row */ );
            osc[c].display();
            popMatrix();
          }
        }
      }
    }
  }  // End display method
  
}  // End OscRing class
