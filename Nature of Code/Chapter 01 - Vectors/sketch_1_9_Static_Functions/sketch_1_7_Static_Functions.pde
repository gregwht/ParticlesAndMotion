void setup() {
  PVector v = new PVector(1, 5);
  PVector u = PVector.mult(v, 2);
  PVector w = PVector.sub(v, u);
  
  w = PVector.div(w,3);
  
  println(v);
  println(u);
  println(w);
}

