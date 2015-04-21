//Oscillator osc, osc5, osc7;
Oscillator[] osc;
Middle mid;

void setup() {

  size(720, 720, P2D);  // Or 640px, with margin *1 below
  background(255);
  smooth();
  
  float x = (width-3*40)/40;
  println(x);

  for(int i = 3; i < x; i += 2){
    osc[i] = new Oscillator(i);
    
//  osc = new Oscillator(3);
//  osc5 = new Oscillator(5);
//  osc7 = new Oscillator(7);
  // mid = new Middle(1);
  }
}

void draw() {

  background(255);

  //  mid.oscillate();
  //  mid.display();
  //  
 for (int i = 3; i < 15; i += 2){
  osc[i].oscillate();
  osc[i].display(40);
 }

//  osc5.oscillate();
//  osc5.display(80);
//  osc7.oscillate();
//  osc7.display(120);
 
 
 
}

