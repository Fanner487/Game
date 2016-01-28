class Ball extends Sprite implements Power
{
  float ballWidth;
  float ballHeight; 

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

    if (this.right > width)
    {
      //right
      this.xspeed = -(xspeed); 
    }
    if (this.left < game.border) {
      //left
      this.xspeed = -(xspeed);
    }
    if(this.top < 0)
    {
      //top
      this.yspeed = -(yspeed);
    }
    if(this.bottom > height)
    { 
      //bottom
      this.yspeed = -(yspeed);
    }
  }
  

  void add1(Sprite sprite)
  {
    for(int i = 0; i < sprites.size(); i++)
    {
      Sprite game = sprites.get(i);
      
      if(game instanceof Game)
      {
        ((Game) game).score++;
      }
    }
  }
}