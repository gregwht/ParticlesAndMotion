class Line {

  //Define parameters
  float x1, y1, x2, y2;
  int c0, c1, c2, c3;

  // Define constructor
  Line(float x1In, float y1In, float x2In, float y2In) {

    x1 = x1In;
    y1 = y1In;
    x2 = x2In;
    y2 = y2In;
  }

  void display() {
    stroke(255, 0, 150);
    line(x1, y1, x2, y2);
  }

  void update(float ySpeed) {

    y2 += ySpeed;

    if (y2 >= (height/4)*3) {

      y1 += ySpeed;
    }

    if (y2 >= height) {

      y2 = height;
    }

    if (y1 >= height) {

      y1 = 0;
      y2 = 0;

      y2 += ySpeed;
    }
  }
}

