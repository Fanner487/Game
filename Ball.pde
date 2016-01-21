class Ball extends Sprite
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
    
    left = pos.x - halfB;
    right = pos.x + halfB;
    top = pos.y - halfB;
    bottom = pos.y + halfB;
    
    speed = 3;
    xspeed = speed;
    yspeed = speed;
    
  }

  void render()
  {
    ellipse(pos.x, pos.y, ballWidth, ballHeight);
  }

  void update()
  {
    //this.pos.x -= xspeed;
    this.pos.y -= yspeed;

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
}