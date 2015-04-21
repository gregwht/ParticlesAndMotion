
Mover john;

void setup(){
  size(600,600, P2D);
  smooth(); 
  background(255);
  john = new Mover();
}


void draw(){
 if(!mousePressed){
  background(255);
 }
 
  john.update();
  john.checkEdges();
  john.display();
  
  if(key == 'p'){
   saveFrame("image-####.png" + millis());  
   exit();
  }
}
