// Initial goal to build a program which draws an array of lines,
// first at black, then dark grey, then light grey, then white.
// (In the style of GREY by Nicolas Sassoon)
// Got derailed rather quickly.

// Currently looking at moire / falling lines


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
    line[i] = new Line(10 * i, height/3, 20 * (2*i), 20 * (2*i));
  }
}




void draw() {
  
  for (int i = 0; i < line.length; i++){
   
    line[i].display();
    
  }
}

