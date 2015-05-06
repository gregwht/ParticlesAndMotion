Oscillator osc = new Oscillator();

void setup() {

  size(720, 720, P2D);  // Or 640px, with margin *1 below
  background(255);
  smooth();
}

void draw() {

  background(255);

  osc.oscillate(0);
  osc.display();
}

