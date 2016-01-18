class ScorePower extends Sprite
{
  int size;
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
}