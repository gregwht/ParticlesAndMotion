OscRing[] ring = new OscRing[16];

void setup() {

  size(720, 720, P2D);  // Or 640px grid, with margin
  background(255);
  smooth();

  for (int i = 1; i < 16; i+= 2)
  {
    ring[i] = new OscRing(i, i);
  }
  
}

void draw() {

  background(255);
  
  int preDelay = 1085; //Use 1075 - 1100

  for (int i = 1; i < 16; i+= 2)
  {
    ring[i].oscillate((i+1) * preDelay); // Add 1 to i so that first matchstick doesn't start immediately as program runs 
    ring[i].delayCheck(0);
    ring[i].display();
  }
}

