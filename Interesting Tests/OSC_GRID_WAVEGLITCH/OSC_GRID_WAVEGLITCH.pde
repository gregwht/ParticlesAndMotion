
OscRing[] ring = new OscRing[16];

void setup() {

  size(720, 720, P2D);  // Or 640px, with margin *1 below
  background(255);
  smooth();

  for (int i = 0; i < 16; i++)
  {
  ring[i] = new OscRing(i, i, 0);
  }
  
}

void draw() {

  background(255);

  for (int i = 0; i < 16; i++)
  {
    ring[i].oscillate();
    ring[i].display();
  }
}

