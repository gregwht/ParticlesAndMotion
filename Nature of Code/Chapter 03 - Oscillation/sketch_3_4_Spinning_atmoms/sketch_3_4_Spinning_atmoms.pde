// Converting from polar (magnitude and angle)
// to Cartesian coordinates (x and y).

float r = 75;      // Magnitude / length
float theta = 0;   // Angle (expressed in equations
// using Theta symbol)

float theta2 = 0;
void setup() {

  size(600, 600);
  background(255);
  smooth();
}

void draw() { 

  background(255);  
  
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  float x2 = r * cos(theta2) + x/2;
  float y2 = r * sin(theta2);
  
  noStroke();
  fill(255, 0, 150);
  ellipse(x + width/2, y + height/2, 16, 16);
  ellipse(x2 + width/2, y2 + height/2, 16, 16);
  theta += 0.05;
  theta2 += 0.1;
  stroke(0);
  line(x + width/2, y + height/2, x2 + width/2, y2 + height/2);
}

