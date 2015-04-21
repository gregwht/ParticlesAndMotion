float r = 30;
float speed = 0.001;
void setup(){

  
  size(600, 600, P2D);
  background(255);
  
}


void draw(){
  
  background(255);
  
  smooth();
  
  translate(width/2, height/2);
  float angle = radians(speed);
  rotate(angle);
  
  stroke(0, 255, 150, 150);
  strokeWeight(2);
  line((width/4)*1 - width/2, height/2 - height/2, (width/4)*3 - width/2, height/2 - height/2);
  
  noStroke();
  fill(255, 0, 150);
  ellipse((width/4)*1 - width/2, height/2 - height/2, r, r);
  ellipse((width/4)*3 - width/2, height/2 - height/2, r, r);
  
  speed += speed;
}

