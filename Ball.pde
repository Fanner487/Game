class Ball extends Sprite implements Power
{
  float ballWidth;
  float ballHeight;
  
  //put in abstract
  float speed;
  

  Ball(float x, float y, color colour)
  {
    this.pos = new PVector(x, y);
    this.colour = colour;
    ballWidth = 20;
    ballHeight = ballWidth;
    halfWidth = ballWidth * 0.5f;
    
    
    
    speed = 5;
    xspeed = speed;
    yspeed = speed;
    
  }

  void render()
  {
    stroke(255);
    fill(this.colour);
    ellipse(pos.x, pos.y, ballWidth, ballHeight);
  }

  void update()
  {
    this.pos.x -= xspeed;
    this.pos.y -= yspeed;
    
    left = pos.x - halfWidth;
    right = pos.x + halfWidth;
    top = pos.y - halfWidth;
    bottom = pos.y + halfWidth;

    if (pos.x > width - halfWidth)
    {
      //right
      this.xspeed = -(xspeed); 
    }
    if (pos.x < halfWidth) {
      //left
      this.xspeed = -(xspeed);
    }
    if(pos.y < halfWidth)
    {
      //top
      this.yspeed = -(yspeed);
    }
    if(pos.y > height - halfWidth)
    { 
      //bottom
      this.yspeed = -(yspeed);
    }
  }
  
  void scoreAdd(Game game)
  {
    game.score += 1;
  }
  
  void ammoAdd(Paddle paddle){}
}