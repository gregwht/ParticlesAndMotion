Oscillator osc = new Oscillator();
OscRing ring;

void setup() {

  size(720, 720, P2D);  // Or 640px, with margin *1 below
  background(255);
  smooth();
  
  ring = new OscRing(15, 15, 80, 1000);
}

void draw() {

  background(255);

//  osc.oscillate(0);
//  osc.display();
  
  ring.display();
  ring.oscillate();
  
}

