class AmmoPower extends Sprite implements Power
{
  
  AmmoPower(int x)
  {
    this.pos = new PVector(x, 20);
    this.colour = color(0,255,0);
    size = 10;
    speed = 5;
  }
  
  void update()
  {
    //theta += 0.1f;
    pos.y += speed;
    
    
    if(theta > TWO_PI)
    {
      theta = 0;
    }
    
    if (pos.y > height)
    {
      pos.y = 0;
    }
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    triangle(0, 10, 10, 10, 5, 0);
    popMatrix();
  }
  
  
  void scoreAdd(Game game){}
  
  
  void ammoAdd(Paddle paddle)
  {
    paddle.ammo++;
  }
  
  void paddleCollision()
  {
    if((pos.y + 5 >= paddle.pos.y - paddle.halfPHeight) && (pos.x >= paddle.pos.x - paddle.halfPWidth) && (pos.x <= paddle.pos.x + paddle.halfPWidth))
    {
      ((Power) this).ammoAdd((Paddle) paddle);
      ammos.remove(this);
      
    }
  }
}