import oscP5.*;
import netP5.*;

// Sit back and watch the patterns emerge!
OscP5 osc = new OscP5(this, 8000);

OscRing[] ring = new OscRing[16];

float bpm;
float bpb;

// Experiment with these values
PVector velocity = new PVector(0.05, 0.15);
PVector amplitude = new PVector(20, 20);
int preDelay = 1065; // Use 1065 - 1100

void setup() {

  size(720, 720, P2D);  // Or 640px grid, with margin
  background(255);
  smooth();

  osc.plug(this, "getBpm", "/bpm");
  osc.plug(this, "getBpb", "/bpb");

  bpm = 120;
  bpb = 4;
  
  for (int i = 1; i < 16; i+= 2)
  {
    ring[i] = new OscRing(i, i, velocity.x, velocity.y, amplitude.x, amplitude.y);
  }
}

public float getBpm(float _bpm) {
  
  bpm = _bpm;
  println("### plug event method. received a message /bpm.");
  println(" 1 float received: "+ bpm);
  return bpm;
}

public float getBpb(float _bpb) {
  
  bpb = _bpb;
  println("### plug event method. received a message /bpb.");
  println(" 1 int received: "+ bpb);
  return bpb;
}

void draw() {

  background(255);

  //`int preDelay = 1060; 

  for (int i = 1; i < 16; i+= 2)
  {
    ring[i].oscillate((i+3) * preDelay, bpm, bpb); // Add 1 to i so that first matchstick doesn't start immediately as program runs 
    ring[i].delayCheck(0);
    ring[i].display();
  }
}



