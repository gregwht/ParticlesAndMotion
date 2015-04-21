float angle = 0;
float aVelocity = 0.05;

void setup() {

  size(400, 400, P2D);
  smooth();
}

void draw() {

  background(255);

  float amplitude = 100;

  float x = amplitude * cos(angle);
  angle += aVelocity;

  ellipseMode(CENTER);
  translate(width/2, height/2);
  stroke(0, 255, 150);
  line(0, 0, x, 0);
  noStroke();
  fill(255, 0, 150);
  ellipse(x, 0, 20, 20);
}

