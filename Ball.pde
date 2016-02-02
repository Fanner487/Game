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

    speed = 3;
    xspeed = speed;
    yspeed = speed;
    
  }
  
  
  void speedUp()
  {
    if(xspeed < 0)
    {
      xspeed = -(xspeed);
      xspeed += 0.5f;
      
      yspeed += 0.5f;
    }
    else if(yspeed < 0)
    {
      yspeed = -(yspeed);
      yspeed += 0.5f;
      
      xspeed += 0.5f;
    }
    else
    {
      xspeed += 0.5f;
      yspeed += 0.5f;
    }
  }
  void stopBall()
  {

    ball.pos.x = width /2;
    ball.pos.y = 500;
    
    //makes sure ball pointing upwards
    if(ball.yspeed < 0)
    {
      ball.yspeed = -(ball.yspeed);
    }
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
    if (this.top < 0)
    {
      //top
      this.yspeed = -(yspeed);
    }
    if (this.bottom > height)
    { 
      //bottom
      this.yspeed = -(yspeed);
    }
  }


  void add1(Sprite sprite)
  {
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite game = sprites.get(i);

      if (game instanceof Game)
      {
        ((Game) game).score++;
      }
    }
  }
}