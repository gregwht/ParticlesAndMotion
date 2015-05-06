// Version of slime sketch 
// Using a ball travelling down the screen,
// no background refresh.
// Continuously +/- some noise to x position.
// When ball hits the bottom, respawn at top
// SAME COLOUR AS BACKGROUND
// Then it will erase some of the previous path but not all,
// because of noise.
// When it hits bottom, return to paint colour.


Ball[] ball;
int ballNum = 100;

void setup(){
  
 size(1000, 1000);
 background(0);
  
}
