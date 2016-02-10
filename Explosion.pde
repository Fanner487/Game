//creates explosion when rocket hits block
class Explosion extends Sprite
{
  Explosion(float x, float y, color c)
  {
    super(x, y, c);
    size = 0;
    
  }
  
  void update()
  {
    if(size >= 50)
    {
      sprites.remove(this);
    }
    else
    {
      size += 15;
    }
    
    
  }
  
  void render()
  {
    stroke(255);
    fill(colour);
    ellipse(pos.x, pos.y, size, size);
  }
}