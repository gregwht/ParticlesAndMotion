float r = 16;
float angle = 0;              // Like location
float aVelocity = 0;          // Like velocity
float aAcceleration = 0.001;  // Like acceleration

void setup(){

  
  size(600, 600, P2D);
  background(255);
  
}


void draw(){
  
  background(255);
  smooth();
  rectMode(CENTER);
  
  translate(width/2, height/2);
  rotate(angle);
  
  stroke(0, 255, 150, 150);
  strokeWeight(2);
  line(-50, 0, 50, 0);
  
  noStroke();
  fill(255, 0, 150);
  ellipse(-50, 0, r, r);
  ellipse(50, 0, r, r);

  aVelocity += aAcceleration;    // Angular equivalent of velocity.add(acceleration);
  angle += aVelocity;            // Angular equivalent of location.add(velocity);
}

