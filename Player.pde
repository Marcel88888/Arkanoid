class Player {
   
  private PVector position, velocity;
  private PImage base;
  private int baseWidth = 186;
  private int baseHeight = 50;
  
  Player() {
     base = loadImage("vaus.png");
     position = new PVector(width/2, height - 100);
     velocity = new PVector(5, 0);
  }
  
  void move() {
    if(mousePressed){
      if(mouseX <= width/2) {
        position.x -= velocity.x;
      } 
      else {
        position.x += velocity.x;
      }
    }
    position.x = constrain(position.x, baseWidth/2, width - baseWidth/2);
  }
  
  void display() {
     imageMode(CENTER);
     image(base, position.x, position.y);
  }
  
  PVector getPosition() {
     return position; 
  }
  
  int getBaseWidth() {
     return baseWidth;
  }
  
  int getBaseHeight() {
     return baseHeight; 
  }
}
