class Block extends Sprite
{
  float blockWidth;
  float blockHeight;
  float halfBlockWidth;
  float halfBlockHeight;
  boolean hit;
  
  Block(int x, int y, color colour)
  {
    this.pos = new PVector(x, y);
    this.colour = colour;
    this.blockWidth = 60;
    this.blockHeight = 20;
    this.halfBlockWidth = blockWidth * 0.5f;
    this.halfBlockHeight = blockHeight * 0.5f;
    this.left = pos.x - halfBlockWidth;
    this.right = pos.x + halfBlockWidth;
    this.top = pos.y - halfBlockHeight;
    this.bottom = pos.y + halfBlockHeight;
    
    this.hit = false;
  }
  
  void render(){
    rect(pos.x, pos.y, blockWidth, blockHeight);
  }
  void update(){}
  
}