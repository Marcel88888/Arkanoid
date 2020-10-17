class Ball {
   
  private Board board;
  private PVector position;
  private PVector velocity;
  private int diameter = 60;
  
  Ball(PVector playerPosition, Board _board) { 
    board = _board;
    setPosition(playerPosition);
  }
  
  void setPosition(PVector playerPosition) {
    position = new PVector(playerPosition.x, playerPosition.y - board.getBlockHeight()/2);
    velocity = new PVector(7, -7);
  }
  
  void display() {
    fill(color(0, 255, 0));
    noStroke();
    ellipse(position.x, position.y, diameter, diameter);
  }
  
  void move() {
    position.add(velocity); 
  }
  
  void bounce(PVector objectPosition, int objectWidth, int objectHeight) {
    float rightBorder = objectPosition.x + objectWidth/2 + diameter/2;
    float leftBorder = objectPosition.x - objectWidth/2 - diameter/2;
    float upperBorder = objectPosition.y - objectHeight/2 - diameter/2; 
    float lowerBorder = objectPosition.y + objectHeight/2 + diameter/2;
    if(position.x >= leftBorder && position.x <= rightBorder && position.y >= upperBorder && position.y <= lowerBorder ) {
       if(position.y <= objectPosition.y + objectHeight/2 && position.y >= objectPosition.y - objectHeight/2 && position.x >= objectPosition.x - objectWidth/2) 
          velocity.x *= -1;    
        else if(position.y <= objectPosition.y + objectHeight/2 && position.y >= objectPosition.y - objectHeight/2 && 
                position.x <= objectPosition.x + objectWidth/2)
          velocity.x *= -1;      
        else if(position.x <= objectPosition.x + objectWidth/2 + diameter && position.x >= objectPosition.x - objectWidth/2 - diameter && 
                position.y <= objectPosition.y + objectHeight/2 + diameter) 
          velocity.y *= -1; 
        else if(position.x <= objectPosition.x + objectWidth/2 + diameter && position.x >= objectPosition.x - objectWidth/2 - diameter && 
                position.y >= objectPosition.y - objectHeight/2 - diameter) 
          velocity.y *= -1;
    }
      
  }
  
  void checkBorders() {
    if(position.x <= diameter/2 || position.x >= width - diameter/2)
      velocity.x *= -1;
    else if(position.y <= diameter/2) 
      velocity.y *= -1;
  }
  
  boolean checkIfGameIsOver() {
     if(position.y > height) 
       return true;
     else
       return false;
  }
  
  boolean removeBlock(ArrayList<PVector> blocks, ArrayList<Integer> colores, int blockWidth, int blockHeight) {
    boolean removed = false;
    for(int i=0; i<blocks.size(); i++) {
      PVector block = blocks.get(i);
      float leftBorder = block.x - diameter/2;
      float rightBorder = block.x + blockWidth + diameter/2; 
      float upperBorder = block.y - diameter/2;
      float lowerBorder = block.y + blockHeight + diameter/2;
      if(position.x >= leftBorder && position.x <=  rightBorder && position.y >= upperBorder && position.y <= lowerBorder) {
        if(position.y <= block.y + blockHeight && position.y >= block.y && position.x >= block.x) 
          velocity.x *= -1;    
        else if(position.y <= block.y +blockHeight && position.y >= block.y && position.x <= block.x + blockWidth)
          velocity.x *= -1;      
        else if(position.x <= block.x + blockWidth + diameter && position.x >= block.x - diameter && position.y <= block.y + blockHeight + diameter) 
          velocity.y *= -1; 
        else if(position.x <= block.x + blockWidth + diameter && position.x >= block.x - diameter && position.y >= block.y - diameter) 
          velocity.y *= -1;

        blocks.remove(i);
        colores.remove(i);
        removed = true;
      }
    }
    return removed;
  }
}
