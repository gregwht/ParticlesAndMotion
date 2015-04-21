// Converting from polar (magnitude and angle)
// to Cartesian coordinates (x and y).

float r = 0;      // Magnitude / length
float theta = 0;   // Angle (expressed in equations
// using Theta symbol)

void setup() {

  size(600, 600);
  background(255);
  smooth();
}

void draw() { 

  float x = r * cos(theta);  // Convert (r, theta) into
  float y = r * sin(theta);  // (x, y), for drawing ellipse
  
  // Draw line from centre to ellipse
//  stroke(0, 255, 150);
//  line(width/2, height/2, x + width/2, y + height/2);
    
  // Draw ellipse  
  noStroke();
  fill(255, 0, 150);
  ellipse(x + width/2, y + height/2, 16, 16);
  
  // Increment theta (bigger number = faster speed)
  theta += 0.1;  // 0.1 and 0.25 makes nice pattern
  r += 0.25;
  
  if (mousePressed){
    
    save("millis().png");
    exit();
  }
}

