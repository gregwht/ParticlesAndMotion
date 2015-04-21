Oscillator[] osc = new Oscillator[15 * 15];

void setup() {

  size(720, 720, P2D);  // Or 640px, with margin *1 below
  background(255);
  smooth();

  for (int i = 0; i < osc.length; i++) {
    osc[i] = new Oscillator();
  }
}

void draw() {

  background(255);

  for (int j = 0; j < 15; j++) {
    osc[j].oscillate();
    for (int i = 0; i < 15; i++) {
      float margin = 40;
      osc[i].display(margin*2 + i * margin, margin*2 + j * margin);
    }
  }
  
  if(mousePressed){
    saveFrame();
    exit();
  }
  
}

