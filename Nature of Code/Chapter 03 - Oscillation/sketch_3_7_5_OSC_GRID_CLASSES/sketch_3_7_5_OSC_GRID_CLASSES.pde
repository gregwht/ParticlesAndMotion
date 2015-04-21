Oscillator osc;

void setup() {

  size(720, 720, P2D);  // Or 640px, with margin *1 below
  background(255);
  smooth();

  osc = new Oscillator(3);
}

void draw() {

  background(255);


  osc.oscillate();
  osc.display();
}


