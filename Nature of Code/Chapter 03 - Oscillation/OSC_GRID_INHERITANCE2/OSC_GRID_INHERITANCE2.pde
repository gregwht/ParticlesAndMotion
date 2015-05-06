// Sit back and watch the patterns emerge!

OscRing[] ring = new OscRing[16];

// Experiment with these values
PVector velocity = new PVector(0.05, 0.15);
PVector amplitude = new PVector(20, 20);
int preDelay = 1065; // Use 1075 - 1100

void setup() {

  size(720, 720, P2D);  // Or 640px grid, with margin
  background(255);
  smooth();

  for (int i = 1; i < 16; i+= 2)
  {
    ring[i] = new OscRing(i, i, velocity.x, velocity.y, amplitude.x, amplitude.y);
  }
  
}

void draw() {

  background(255);
  
  //`int preDelay = 1060; 

  for (int i = 1; i < 16; i+= 2)
  {
    ring[i].oscillate((i+1) * preDelay); // Add 1 to i so that first matchstick doesn't start immediately as program runs 
    ring[i].delayCheck(0);
    ring[i].display();
  }
}

