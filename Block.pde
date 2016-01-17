class Block extends Sprite
{
  float blockWidth;
  float blockHeight;
  float halfBlockWidth;
  float halfBlockHeight;
  //abstract
  float speed;
  boolean hit;
  
  Block(int x, int y, color colour)
  {
    this.pos = new PVector(x, y);
    this.colour = colour;
    blockWidth = 60;
    blockHeight = 20;
    halfBlockWidth = blockWidth * 0.5f;
    halfBlockHeight = blockHeight * 0.5f;
    left = pos.x - halfBlockWidth;
    right = pos.x + halfBlockWidth;
    top = pos.y - halfBlockHeight;
    bottom = pos.y + halfBlockHeight;
    speed = 3;
    xspeed = speed;
    
    hit = false;
  }
  
  void render(){
    rect(pos.x, pos.y, blockWidth, blockHeight);
  }
  void update(){
    pos.x += xspeed;
    
    if(right >= width || pos.x - halfBlockWidth <= 0)
    {
      xspeed = -(xspeed);
    }
  }
  
}