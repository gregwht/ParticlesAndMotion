//int rNum = 15;
//int cNum = 15;

Oscillator[] osc = new Oscillator[9];

void setup() {

  size(720, 720, P2D);  // Or 640px, with margin *1 below
  background(255);
  smooth();

  for (int i = 0; i < 9; i++) {

    osc[i] = new Oscillator();
  }

  float margin = 40;
  float rowLength = (width - margin * 3)/40;    // Max number of matches in a row
  float colLength = (height - margin * 3)/40;   // Max number of matches in a column
  // The (-margin*3)/40 is to leave thick border of whitespace
  println(rowLength);
  println(colLength);
}
void draw() {

  background(255);

  for (int i = 0; i < 8; i++) {

    osc[i].oscillate(0);
    // (rowLength, colLength, margin)
    osc[i].display(2*i + 1, 2*i + 1, 360 - i*40);// Put the result of matchNum (above) here. Not sure why wouldn't work.     

  }
}

