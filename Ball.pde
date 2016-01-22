class Ball extends Sprite implements Power
{
  float ballWidth;
  float ballHeight;
  float halfB;
  //put in abstract
  float speed;
  

  Ball(float x, float y, color colour)
  {
    this.pos = new PVector(x, y);
    this.colour = colour;
    ballWidth = 20;
    ballHeight = ballWidth;
    halfB = ballWidth *0.5f;
    
    
    
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
    
    left = pos.x - halfB;
    right = pos.x + halfB;
    top = pos.y - halfB;
    bottom = pos.y + halfB;

    if (pos.x > width - halfB)
    {
      //right
      this.xspeed = -(xspeed); 
    }
    if (pos.x < halfB) {
      //left
      this.xspeed = -(xspeed);
    }
    if(pos.y < halfB)
    {
      //top
      this.yspeed = -(yspeed);
    }
    if(pos.y > height - halfB)
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