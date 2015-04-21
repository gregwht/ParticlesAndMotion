class Ball {

  float x;
  float y;
  float r = 75;      // Magnitude / length
  float theta = 0.5;   // Angle (expressed in equations
  // using Theta symbol)

  Ball (float x_, float y_, float r_, float theta_) {

    x = x_;
    y = y_;
    r = r_;
    theta = theta_;
  }

  void update(){    
    float x = r * cos(theta);
    float y = r * sin(theta);

    theta += 0.01;
  }

  void display() {

    noStroke();
    fill(255, 0, 150);
    ellipse(x, y, 16, 16);
  }
}

