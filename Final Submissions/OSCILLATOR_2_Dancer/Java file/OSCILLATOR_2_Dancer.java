import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import oscP5.*; 
import netP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class OSCILLATOR_2_Dancer extends PApplet {

/**
 ===========================================
 ||                                       ||
 ||         PARTICLES AND MOTION          ||
 ||        Oscillators 2: Dancer          ||
 ||            Gregory White              ||
 ||                                       ||
 ===========================================
 
 Programming for Artists Term 2 Project
 IS71017A
 MA in Computational Arts
 Goldsmiths' College
 
 Thanks are due for Tim Blackwell, for running another fun and engaging term of 
 Java programming (I especially liked learning about sandpile and hailstone algorithms
 and their creative applications - next project!). Thanks also to the rest of the class
 at Goldsmiths for pushing me to keep improving my abilities and ideas.
 Finally, thanks to Daniel Shiffman and the team involved with Head First Java,
 for putting together books that explain and inspire. 
 
 Please note: All of my project work and further experiments can be downloaded from my GitHub,
 at https://github.com/gregcw/ParticlesAndMotion
 
 
 Aim
 ---
 
 For this project, I didn't have a particular vision of a final program of product
 I wanted to create. Instead, I had several areas I wanted to explore and learn more about:
 
 - Following on from the use of particles in first term's Audiovisual Sandbox project,
   I wanted to learn more about animating motion, particularly smooth motion using sine
   functions, and trigonometry.
 - Look at emergence, and make interesting patterns by implementing a small set of rules
   on many particles
 - Take inspiration from observed behaviour or patterns in the outside world
 
 
 After working through the first few chapters of The Nature of Code, I narrowed my aim down:
 - To create smoothly animated emergent patterns inspired by my bathroom mat.
 
 Let me explain further: My bathroom mat at home consists of a grid of bobbles.
 When you step on the bobbles, they are pressed down in the direction of your foot.
 When pressed down the bobbles lean on each other create interesting patterns
 (similar to grass or straw). The slight changes of direction cause interesting
 wavy patterns. This was the inspiration for the default animation pattern that launches
 when you start the program (or press the '2' or '4' key during operation).
 
 
 I have ended up with a few different versions of my program: 
 * Version 1: Standard program that produces oscillating patterns
 * Version 2: (this one) Program that implements inheritance with a 'Dancer' class.
              Parameters can be manipulated over OSC (working towards audiovisual 
              synchonicity with Ableton & Max for Live). 
              I am in the process of building a Max for Live device, which sends
              the tempo and beats per bar of the current Ableton session over OSC.
              I have included this on my GitHub, but the OSC object I am trying to use
              (by CNMAT) is not working in Max for Live. For demonstration purposes 
              I am sending information via Max MSP (also included on my Github).   
 
 Process
 -------
 
 In this version of my program, I have three classes:
 * An Oscillator class, which creates an animated particle
 * An Oscillator Ring class, which creates rings of Oscillators
 * A Dancer class, which extends the class 'Oscillator'.
 
 First, an array of Oscillator Rings is declared and initialised, with the following values:
 * Space between particles
 * Number of rows
 * Number of columns
 * x and y velocities
 * x and y amplitudes
 
 Each Oscillator Ring creates a set of Dancer objects, the number of columns and rows
 steadily increasing with each iteration through the for loop. The Dancer objects are 
 passed the velocities and amplitudes given when calling the OscRing constructor. 
 
 We then iterate through the rings, and call the oscillate() method on them.
 This method waits for the specified delay time * i, then calls the Dancer
 object's own oscillate() method, passing on the 'beats per minute' and 
 'beats per bar' values from Max/Live. 
 
 The Dancer object's method calculates the x and y position of the particle, 
 using Daniel Shiffman's algorithm from 'The Nature of Code'. The x and y velocities
 are dependent on the bpm and bpb from Max/Live so are different. This causes
 a different kind of 'dancing' movement. The user can select different ways of 
 calculating these positions by pressing the keys 1 - 9.  
 See the comments in the oscillate() method of the Oscillator class for a breakdown 
 of the process.

 Then we display the particles. In order to create the emergent patterns, I decided to 
 organise the particles into rings, whose animation could be offset slightly. 
 This required me to devise my own algorithm to calculate the drawing of rings - a 
 detailed breakdown of the algorithm can be read in the display() method of the OscRing class.
 
 
 Comments
 --------
 When displaying the particles, by defauly a green line is drawn between each particle and its origin.
 This was put in to help emulate the bobbly rug pattern explained above.
 Commenting out this line (under the Oscillator object's display() function) can create a 
 sense of depth, almost as if looking down a tunnel, especially after pressing the '2' or '4' key. 
 
 Also try playing around with the values declared at the top of this class
 (space, velocity, amplitude, and preDelay) to create your own interesting patterns.
 
 Evaluation
 ----------
 
 I am pleased with the final outcome of my project, as I have managed to create
 visually exciting patterns and illusions using a set of very simple rules. 
 
 I have also learnt more about all of the topics I declared at the outset, and more. 
 Here's a list of some of the topics I've covered:
  - Randomness
  - Vectors
  - Forces / physics
  - Oscillation
  - Geometry and trigonometry
  - Polar vs cartesian coordinates
  - Using sin/cos/tan to create smoother, natural looking motion 
  - Algorithmic approach to layout

 And some areas I've started to explore:
  - Exporting animations as GIFs, using threads
  - Implementing a GUI to change values 
  - Communication with Ableton & Max for Live over OSC
 
 Here is a list of improvements I would like to make:
  - All particles appear at once, instead of gradually
  - Properly implement GIF export, that creates smooth GIFs 
    (Think I have to experiment with framerate)
  - Currently I make grids of particles, but only draw the
    perimeter so they look like rings. Creating true rings of
    particles would be more efficient.
  - Explore different layouts and patterns that aren't grid-based -  
    perhaps radial designs
  - For Dancer class: 
      * Figure out correct algorithms for converting seconds into velocity
        (So we can use the tempo and beats per bar to specify how many 
        complete oscillations occur per second)
      * Complete Max for Live device, replacing CNMAT's OpenSoundControl
        object with something that works in M4L (or figure out how to
        get the object to work). 

 
 Sit back and watch the patterns emerge!
 
**/

// -------------------------------------------------------------------------------
//
// NOTE: CODE WITHIN /***/ MARKERS HAS BEEN TAKEN FROM
//       oscP5plug EXAMPLE BY ANDREAS SCHLEGEL
//       http://www.sojamo.de/libraries/oscP5/examples/oscP5plug/oscP5plug.pde
//       FOUND ON CONCEPTUAL INERTIA (ANDREW SPITZ)
//       http://www.conceptualinertia.net/aoakenfo/sketch-1
//
// -------------------------------------------------------------------------------

// Import oscP5 and netP5 libraries 
/***/


/***/

// Declare and initialise the Osc connection 
/***/
OscP5 osc = new OscP5(this, 8000);
/***/
// Create an array of Oscillator rings
OscRing[] ring = new OscRing[16];

float bpm;  // Beats per minute from Max/Live 
float bpb;  // Beats per bar from Max/Live

// Experiment with these values
float   space = 40;                            // Space between particle origins
PVector velocity = new PVector(0.05f, 0.15f);    // How fast the particles move
PVector amplitude = new PVector(20, 20);       // How far from the particles move from their origin
int     preDelay = 1065;                       // (Use ~1065 - ~1100)    
                                               // Offset before each ring starts animating - 
                                               // causes varying amounts of trippiness.

public void setup() {

  size(720, 720, P2D);  // We want a 640px grid of particles, with a white margin
  background(255);      // A nice, clean white background
  smooth();             // Make it prettier!

  // Use plug method to pass bpm and bpb values to the getBpm and getBpb methods
  // so that they can be used in the Dancer's oscillate() method.
  /***/
  osc.plug(this, "getBpm", "/bpm"); // If the OSC message starts with /bpm, send to getBpm()
  osc.plug(this, "getBpb", "/bpb"); // If the OSC message starts with /bpb, send to getBpb()
  /***/
  
  // Initialise bpm and bpb values with Ableton Live's default values
  bpm = 120;
  bpb = 4;
  
  // Iterate through our Oscillator rings and initialise them with:
  //  * Space between particles
  //  * Number of rows
  //  * Number of columns
  //  * x and y velocities
  //  * x and y amplitudes
  for (int i = 1; i < 16; i+= 2)
  {
    ring[i] = new OscRing(space, i, i, velocity.x, velocity.y, amplitude.x, amplitude.y);
  }
}

// Set bpm to the value preceeded by /bpm
/***/
public float getBpm(float _bpm) {
  
  bpm = _bpm;
  println("### plug event method. received a message /bpm.");
  println(" 1 float received: "+ bpm);
  return bpm;
}

// Set bpb to the value preceeded by /bpb
public float getBpb(float _bpb) {
  
  bpb = _bpb;
  println("### plug event method. received a message /bpb.");
  println(" 1 int received: "+ bpb);
  return bpb;
}
/***/

public void draw() {

  background(255);    // Redraw the background each frame
                      // (although interesting patterns can emerge if you take this out...
                      // ...especially when oscillating using tan...

  for (int i = 1; i < 16; i+= 2)
  { 
    ring[i].oscillate((i+3) * preDelay, bpm, bpb); // Calculate oscillations for each ring, 
                                                   // passing a delay time to offset animation 
                                                   // (We use i+3 so that first particle doesn't 
                                                   // start immediately as the program runs,
                                                   // which can cause it to start out-of-sync 
                                                   // from the other rings. We use 3 instead of
                                                   // 1, like in the previous verson, to give 
                                                   // more time for all the OSC connections to be made). 
                                                   // Finally, we also pass the bpm and bpb values.
    
    ring[i].display();                             // Draw the Oscillator rings
  }
}
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
  public void oscillate(float _bpm, float _bpb) {

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
  public void oscillate(int preDelay, float _bpm, float _bpb) {

    if (millis() >= preDelay) {
      for (int r = 0; r < rNum; r++)
      {
        osc[r].oscillate(_bpm, _bpb);
      }
    }
  } // End oscillate() method


  // Display the Oscillator rings
  public void display() {

    
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
  public void oscillate() {

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


  public void display() {

    stroke(0, 255, 150);            // Set stroke colour to a nice candy green
    line(0, 0, pos.x, pos.y);       // Draw a line from the particle's origin to it's current position
                                    // !!! Commenting out this line can create a sense of depth,
                                    // !!! especially when using case '2' or '4'.
    noStroke();                     // We don't want to particles to have a stroke
    fill(255, 0, 150);              // Fill the particles with a hot pink
    ellipse(pos.x, pos.y, 6, 6);    // Draw the particles at current position
  }

// Getters
  public float getX() {

    return velocity.x;
  }

  public float getY() {

    return velocity.y;
  }

  // Setters
  public void setX(float _xVel) {

    velocity.x = _xVel;
  }

  public void setY(float _yVel) {

    velocity.y = _yVel;
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "OSCILLATOR_2_Dancer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
