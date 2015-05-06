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

  for (int i = 1; i < 16; i+= 2)
  {
    ring[i].oscillate(i * 2000);
    ring[i].delayCheck(0);
    ring[i].display();
  }
}

