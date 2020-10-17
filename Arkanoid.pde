Board board;
Player player;
Ball ball;

int lifes, level, score;
boolean start;
ArrayList<Obstacle> obstacles;

void setup() {
   fullScreen();
   orientation(PORTRAIT);
   textAlign(CENTER, CENTER);
   score = 0;
   lifes = 5;
   level = 1;
   start = false;
   
   board = new Board(level);
   player = new Player();
   ball = new Ball(player.getPosition(), board);
   obstacles = new ArrayList();
   
   obstacles.add(new Obstacle(new PVector(width/4, height/2), 200, 10));
   obstacles.add(new Obstacle(new PVector(width*3/4, height/2), 200, 10));
   
   board.createBoard();
}


void draw() {
  if(!ball.checkIfGameIsOver() && board.getNumberOfBlocks() != 0) {
    background(0, 0, 255);
    board.display();
    for(int i=0; i<obstacles.size(); i++)
      obstacles.get(i).display();
    
    if (!start) {
      fill(255);
      text("Tap the screen\nto start", width/2, height*3/4);
    }
    
    if(mousePressed)
       start = true;
       
    player.move();
    player.display();
     
    ball.display();
     
     if(start) {
       ball.move();
       ball.checkBorders();
       Obstacle obstacle1 = obstacles.get(0);
       Obstacle obstacle2 = obstacles.get(1);
       ball.bounce(obstacle1.getPosition(), obstacle1.getObstacleWidth(), obstacle1.getObstacleHeight());
       ball.bounce(obstacle2.getPosition(), obstacle2.getObstacleWidth(), obstacle2.getObstacleHeight());
       ball.bounce(player.getPosition(), player.getBaseWidth(), player.getBaseHeight()); // bounce off the Vaus
       if (ball.removeBlock(board.getBlocks(), board.getBlocksColors(), board.getBlockWidth(), board.getBlockHeight()))
         score += 10;
     }
     
     fill(255);
     textSize(60);
     text("Level: " + level + "   Score: " + score + "   Lifes: " + lifes, width/2, 70);  
  }
  
  else if(board.getNumberOfBlocks() == 0) {
    background(0, 128, 0);
    fill(0);
    textSize(120);
    text("LEVEL " + level + "\nCOMPLETED", width/2, height/2);
    textSize(60);
    text("Tap the screen\nto continue", width/2, height - 200);
    
    if(mousePressed) {
       level++;
       reset();
    }
  }
  
  else if(lifes == 1) {
    background(255, 0, 0);
    fill(255);
    textSize(120);
    text("GAME OVER\nScore: " + score, width/2, height/2);
    textSize(60);
    text("Tap the screen\nto restart", width/2, height - 200);
    if(mousePressed)
      setup();
  }
  
  else {
    ball.setPosition(player.getPosition());
    start = false;
    lifes--;
  }
}

void reset() {
   board = new Board(level);
   board.createBoard();
   player = new Player();
   ball.setPosition(player.getPosition());
}
