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
    ballWidth = 15;
    ballHeight = ballWidth;
    speed = 5;
    xspeed = speed;
    yspeed = speed;
    halfB = ballWidth / 2;
  }

  void render()
  {
    ellipse(pos.x, pos.y, ballWidth, ballHeight);
  }

  void update()
  {
    pos.x -= xspeed;
    pos.y -= yspeed;

    if (pos.x > width - halfB)
    {
      //right
      xspeed = -(xspeed); 
    }
    if (pos.x < halfB) {
      //left
      xspeed = -(xspeed);
    }
    if(pos.y < halfB)
    {
      //top
      yspeed = -(yspeed);
    }
    if(pos.y > height - halfB)
    { 
      //bottom
      yspeed = -(yspeed);
    }
  }
}