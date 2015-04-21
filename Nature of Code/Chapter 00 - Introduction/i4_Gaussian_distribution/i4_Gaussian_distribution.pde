import java.util.*;
Random generator;

void setup(){
  size(640,200);
  background(255);
  generator = new Random();
}

void draw(){
 
 // Returns random number with a mean of 0 and 
 // standard deviation of 1: 
 float num = (float) generator.nextGaussian(); 
 
 float sd = 60; // Standard deviation
 float mean = 320;
 
 // Multiply the random number by our standard deviation
 // and add the mean
 float xPos = sd * num + mean;
 
 noFill();
 stroke(255, 0, 125, 10);
// noStroke();
// fill(255, 0, 125, 10);
 ellipse(xPos, 100, 16, 16);
}
