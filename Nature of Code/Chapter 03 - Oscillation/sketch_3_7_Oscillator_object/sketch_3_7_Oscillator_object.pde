Oscillator[] osc = new Oscillator[10];

void setup() {

  size(600, 600, P2D);
  background(255);
  smooth();

  for (int i = 0; i < osc.length; i++) {
    osc[i] = new Oscillator();
  }
}

void draw() {

  background(255);

  for (int i = 0; i < osc.length; i++) {
    osc[i].oscillate();
    osc[i].display();
  }
}

