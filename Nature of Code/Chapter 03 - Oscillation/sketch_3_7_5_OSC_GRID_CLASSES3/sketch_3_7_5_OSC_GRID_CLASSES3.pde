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

  // (rowLength, colLength, margin)
  for (int i = 0; i < 9; i++) {

    osc[0].calculate(1, 1, 360, i*125);// Put the result of matchNum (above) here. Not sure why wouldn't work.
    osc[1].calculate(3, 3, 320, i*125);
    osc[2].calculate(5, 5, 280, i*125);
    osc[3].calculate(7, 7, 240, i*125);
    osc[4].calculate(9, 9, 200, i*125);
    osc[5].calculate(11, 11, 160, i*125);
    osc[6].calculate(13, 13, 120, i*125);
    osc[7].calculate(15, 15, 80, i*125); 

    osc[i].oscillate();
  }
}

