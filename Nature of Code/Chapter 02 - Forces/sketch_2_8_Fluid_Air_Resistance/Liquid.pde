class Liquid {

  float x, y, w, h;
  float c;

  Liquid(float x_, float y_, float w_, float h_, float c_) {

    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }

  void display() {

    noStroke();
    fill(0, 255, 150, 100);
    rect(x, y, w, h);
  }
  
}

