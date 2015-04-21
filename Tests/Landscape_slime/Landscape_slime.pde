// Looks like slime thrown at a wall
// Each line starts at a different point
// and moves downwards at a random speed between two values
// Let's try and make it so that 
// Once a slime stream hits the end of the screen
// It is coloured over in black at the same rate
// And then pink again, etc.
// Add x wobble? Or keep straight?


//Variables
Line[] line;
int lineNum = 100;

void setup() {

  size(1000, 1000);
  background(0);


  //Call constructor to make new line objects
  line = new Line[lineNum];

  //Initialise the array, setting parameters
  for (int i = 0; i < line.length; i++) {
    line[i] = new Line(10 * i, 0, 10 * i, random(height/6, height/1.5));
  }
}




void draw() {
  
  background(0);
  for (int i = 0; i < line.length; i++){
   
    line[i].display();
    line[i].update(random(0.1, 1.5)); 
  }
}

