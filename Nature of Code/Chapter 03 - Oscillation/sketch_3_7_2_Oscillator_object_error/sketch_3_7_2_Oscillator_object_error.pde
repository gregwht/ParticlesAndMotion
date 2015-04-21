Oscillator[] osc = new Oscillator[14 * 14];

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

  for (int j = 0; j < 14; j++) {
    for (int i = 0; i < 14; i++) {
      osc[j].oscillate();
      float margin = 40;
      osc[i].display(margin + i * margin, margin + j * margin);
    }
  }
}

