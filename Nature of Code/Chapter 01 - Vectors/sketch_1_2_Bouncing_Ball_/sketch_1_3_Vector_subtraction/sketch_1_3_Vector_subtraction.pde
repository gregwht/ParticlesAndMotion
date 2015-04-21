void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  PVector mouse = new PVector(mouseX, mouseY);
  PVector centre = new PVector(width/2, height/2);
  
  mouse.sub(centre);
  
  translate(width/2, height/2);
  line(0,0,mouse.x,mouse.y);
  
}

