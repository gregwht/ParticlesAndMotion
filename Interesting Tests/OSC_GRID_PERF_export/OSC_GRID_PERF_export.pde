OscRing[] ring = new OscRing[16];
TImage frame;
void setup() {

  size(720, 720, P2D);  // Or 640px grid, with margin
  background(255);
  smooth();

  for (int i = 1; i < 16; i+= 2)
  {
    ring[i] = new OscRing(i, i);
  }

  frameRate(12);
}

void draw() {

  background(255);

  for (int i = 1; i < 16; i+= 2)
  {
    ring[i].oscillate(i * 700);
    ring[i].delayCheck(0);
    ring[i].display();
  }

  if (frameCount >= 120 && frameCount <= 600)
  {
    frame = new TImage(width, height, RGB, sketchPath("frame_" + nf(frameCount, 3)+ ".png"));
    frame.set(0, 0, get());
    frame.saveThreaded();
  }

   
}

