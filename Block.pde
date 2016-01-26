class Block extends Sprite implements Power
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
    blockWidth = 60;
    blockHeight = 20;
    halfWidth = blockWidth * 0.5f;
    halfHeight = blockHeight * 0.5f;
       
    speed = 3;
    xspeed = speed;
    
    //mybe take this out
    hit = false;
  }
  
  void scoreAdd(Game game)
  {
    game.score += 5;
  }
  
  void ammoAdd(Paddle paddle){}
  
  void render(){
    stroke(255);
    fill(this.colour);
    rect(pos.x, pos.y, blockWidth, blockHeight);
  }
  void update(){
    
    pos.x += xspeed;
    
    left = pos.x - halfWidth;
    right = pos.x + halfWidth;
    top = pos.y - halfHeight;
    bottom = pos.y + halfHeight;
    
    //change this. move to collisions class
    if(this.right >= width || this.left <= game.border)
    {
      xspeed = -(xspeed);
    }
  }
  
  
}