class ScorePower extends Sprite
{
  
  ScorePower(int x)
  {
    this.pos = new PVector(x, 20);
    this.colour = color(255,255,255);
    size = 10;
    speed = 5;
  }
  
  void update()
  {
    theta += 0.1f;
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
    rect(0, 0, size, size);
    popMatrix();
    
  }
  void app(Paddle paddle){}
  void applyTo(Game game)
  {
    game.score += 5;
  }
  
  void paddleCollision()
  {
    if((pos.y >= paddle.pos.y - paddle.halfPHeight) && (pos.x >= paddle.pos.x - paddle.halfPWidth) && (pos.x <= paddle.pos.x + paddle.halfPWidth))
    {
      
      
      scores.remove(this);
    }
  }
}