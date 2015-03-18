//Variables
Line[] line;
int lineNum = 100;

void setup() {

  size(600, 600);
  background(0);


  //Call constructor to make new line objects
  line = new Line[lineNum];

  //Initialise the array, setting parameters
  for (int i = 0; i < line.length; i++) {
    line[i] = new Line(10 * i, height/2, 20 * (2*i), 20 * (millis()));
  }
}



void draw() {
  background(0);
  for (int i = 0; i < line.length; i++) {
    line[i] = new Line(10 * i, 0, 20 * (2*i), 20 * (millis()));
    line[i].display();
  }
}

