/**
 ===========================================
 ||                                       ||
 ||         PARTICLES AND MOTION          ||
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
 * Version 2: Program that implements inheritance with a 'Dancer' class.
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
