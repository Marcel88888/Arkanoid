class Obstacle {
   
  private PVector position;
  private int obstacleWidth;
  private int obstacleHeight;
  
  Obstacle(PVector _position, int _width, int _height) {
     position = _position;
     obstacleWidth = _width;
     obstacleHeight = _height;
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(128);
    rect(position.x-obstacleWidth/2, position.y-obstacleHeight/2, obstacleWidth, obstacleHeight);
  }
  
  PVector getPosition() {
     return position; 
  }
  
  int getObstacleWidth() {
     return obstacleWidth;
  }
  
  int getObstacleHeight() {
     return obstacleHeight; 
  }
}
