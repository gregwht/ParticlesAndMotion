Oscillator osc = new Oscillator();
OscRing ring;

void setup() {

  size(720, 720, P2D);  // Or 640px, with margin *1 below
  background(255);
  smooth();

  ring = new OscRing(7, 7, 100);
}

void draw() {

  background(255);

  ring.oscillate();
  ring.display();
  

 
}

