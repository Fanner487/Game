class Ball extends Sprite
{
  float ballWidth;
  float ballHeight;
  float halfB;
  float speed;
  float xspeed;
  float yspeed;

  Ball(float x, float y, color colour)
  {
    this.pos = new PVector(x, y);
    this.colour = colour;
    this.ballWidth = 15;
    this.ballHeight = ballWidth;
    this.halfB = ballWidth * 0.5f;
    this.left = pos.x - halfB;
    this.right = pos.x + halfB;
    this.top = pos.y - halfB;
    this.bottom = pos.y + halfB;
    this.speed = 5;
    this.xspeed = speed;
    this.yspeed = speed;
    
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