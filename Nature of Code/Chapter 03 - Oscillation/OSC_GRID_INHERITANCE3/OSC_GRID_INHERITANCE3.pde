// Sit back and watch the patterns emerge!
/***/
import oscP5.*;
import netP5.*;
OscP5 osc;
NetAddress myLocation;
/***/

OscRing[] ring = new OscRing[16];

// Experiment with these values
PVector velocity = new PVector(0.05, 0.15);
PVector amplitude = new PVector(20, 20);
int preDelay = 1065; // Use 1075 - 1100

float bpm;  // Beats per minute
  int bpb;  // Beats per bar

void setup() {

  size(720, 720, P2D);  // Or 640px grid, with margin
  background(255);
  smooth();

  //--------------------------------------------------------------------------------

  // OSC

  /***/

  /* start oscP5, listening for incoming messages at port 12000 */
  osc = new OscP5(this, 12000);

  /* myLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myLocation is used as a parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. 
   */
  myLocation = new NetAddress("127.0.0.1", 12001);

  /* osc plug service
   * osc messages with a specific address pattern can be automatically
   * forwarded to a specific method of an object. 
   */
  osc.plug(this, "getBpm", "/bpm");
  osc.plug(this, "getBpb", "/bpb");

  /***/

  //--------------------------------------------------------------------------------


  for (int i = 1; i < 16; i+= 2)
  {
    ring[i] = new OscRing(i, i, velocity.x, velocity.y, amplitude.x, amplitude.y);
  }
}

void draw() {

  background(255);

  //`int preDelay = 1060; 

  for (int i = 1; i < 16; i+= 2)
  {
    ring[i].oscillate((i+1) * preDelay); // Add 1 to i so that first matchstick doesn't start immediately as program runs 
    ring[i].delayCheck(0);
    ring[i].display();
  }
}



void mousePressed() {
  OscMessage m = new OscMessage("/bpm");
  OscMessage b = new OscMessage("/bpb");

  m.add(130);
  b.add(5);

  osc.send(m, myLocation);
  osc.send(b, myLocation);

  println("m: " + m + " b: " + b);
}

void oscEvent(OscMessage messages) {  

  // println(messages);

  if (messages.checkAddrPattern("/bpm")) {
    bpm = (messages.get(0).floatValue());
    println(messages.get(0).floatValue());
    getBpm(bpm);
  }

  if (messages.checkAddrPattern("/bpb")) {
    bpb = (messages.get(1).intValue());
  }
}


