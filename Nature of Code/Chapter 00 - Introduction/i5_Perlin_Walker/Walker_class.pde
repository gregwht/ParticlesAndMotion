class Walker {

float x,y;    // position x and y
float tx, ty; // "time" x and y

  Walker() {

    tx = 0;
    ty = 10000;
  }


  void display() {
   // background(255));
    noStroke();
    fill(255, 0, 150, 10);
    ellipse(x, y, 25, 25);
  }


  void step() {

   x = map(noise(tx), 0, 1, 0, width);  // map x pos to noise value
   y = map(noise(ty), 0, 1, 0, height);
   
   tx += 0.01;  // The bigger these numbers,
   ty += 0.01;  // the bigger the jumps
  }
}

