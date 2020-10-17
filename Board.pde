class Board {
   
  private ArrayList<PVector> blocks;
  private ArrayList<Integer> blocksColors;
  private int blockWidth, blockHeight, columns, rows;
  private int sideGap = 100;
  private int upperGap = 200;
  private color[] colors;
  
  Board(int level) {
    
    blocks = new ArrayList();
    blocksColors = new ArrayList();
    colors = new color[5];
    columns = 5 * level;
    rows = 5 * level;
    blockWidth = (int)(width - sideGap*2) / columns;
    blockHeight = (int)(height/2 - upperGap*2) / rows;
    
    colors[0] = color(255, 0, 0); 
    colors[1] = color(0, 255, 0); 
    colors[2] = color(255, 255, 0); 
    colors[3] = color(255, 0, 255); 
    colors[4] = color(0, 255, 255); 
  }
  
  void createBoard() {
    for(int i=0; i<rows; i++) {
      for(int j=sideGap; j<width-sideGap; j+=blockWidth) {
        blocks.add(new PVector(j, i*blockHeight+upperGap)); 
      }
    }
    setColors();
  }
  
  void setColors() {
    int tmp = 0;
    for(int i=0; i<rows; i++) {
      for(int j=0; j<columns; j++) {
        blocksColors.add(colors[tmp]); 
      }
      tmp++;
      if(tmp > 4)
        tmp=0;
    }
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    for(int i=0; i<blocks.size(); i++) {
      PVector block = blocks.get(i);
      int blockColor = blocksColors.get(i);
      fill(blockColor);
      rect(block.x, block.y, blockWidth, blockHeight);
    }
  }
  
  int getBlockWidth() {
    return blockWidth;
  }
  
  int getBlockHeight() {
    return blockHeight;
  }
  
  ArrayList<PVector> getBlocks() {
    return blocks;
  }
  
  ArrayList<Integer> getBlocksColors() {
    return blocksColors;
  }
  
  int getNumberOfBlocks() {
    return blocks.size();
  } 
}
