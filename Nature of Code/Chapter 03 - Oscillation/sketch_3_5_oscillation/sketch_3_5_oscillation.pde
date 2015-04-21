void setup (){
 
 size(600, 200); 
}

void draw(){
  
 background(255);

float period = 120;  // Period of oscillation
/* NOTE: Period =/= frequency.
   Frequency = 1/Period
   If period is 120 frame, frequency is 1/120.
*/
float amp = 150;   // Amplitude - times cos result by this value to scale it

float x = amp * cos(TWO_PI * frameCount / period); // Calculating horizontal location according to the formula for simple harmonic motion

translate(width/2, height/2);
stroke(0, 255, 150);
line(0, 0, x, 0);
noStroke();
fill(255, 0, 150);
ellipse(x, 0, 20, 20);


}
