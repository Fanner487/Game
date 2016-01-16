class Block extends Sprite
{
  float blockWidth;
  float blockHeight;
  boolean hit;
  
  Block(int x, int y, color colour)
  {
    pos = new PVector(x, y);
    this.colour = colour;
    blockWidth = 40;
    blockHeight = 20;
    hit = false;
  }
  
  void render(){
    rect(pos.x, pos.y, blockWidth, blockHeight);
  }
  void update(){}
  
}