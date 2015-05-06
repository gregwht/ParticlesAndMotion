import oscP5.*;
import netP5.*;

OscP5 oscP5;

void setup() {
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,8000);
  
  /* osc plug service
   * osc messages with a specific address pattern can be automatically
   * forwarded to a specific method of an object. in this example 
   * a message with address pattern /test will be forwarded to a method
   * test(). below the method test takes 2 arguments - 2 ints. therefore each
   * message with address pattern /test and typetag ii will be forwarded to
   * the method test(int theA, int theB)
   */
  oscP5.plug(this,"getBpm","/bpm");
  oscP5.plug(this,"getBpb","/bpb");
}


public void getBpm(float bpm) {
  println("### plug event method. received a message /bpm.");
  println(" 1 float received: "+ bpm);  
}

public void getBpb(int bpb) {
  println("### plug event method. received a message /bpb.");
  println(" 1 int received: "+ bpb);  
}

void draw() {
  background(0);
}

/* incoming osc message are forwarded to the oscEvent method. */
//void oscEvent(OscMessage theOscMessage) {
//  /* with theOscMessage.isPlugged() you check if the osc message has already been
//   * forwarded to a plugged method. if theOscMessage.isPlugged()==true, it has already 
//   * been forwared to another method in your sketch. theOscMessage.isPlugged() can 
//   * be used for double posting but is not required.
//  */  
//  if(theOscMessage.isPlugged()==false) {
//  /* print the address pattern and the typetag of the received OscMessage */
//  println("### received an osc message.");
//  println("### addrpattern\t"+theOscMessage.addrPattern());
//  println("### typetag\t"+theOscMessage.typetag());
//  }
//}

