class Rocket extends Sprite
{
  
  Rocket()
  {
    yspeed = -5;
  }
  
  void render()
  {
    stroke(colour);
    
    pushMatrix();
    translate(pos.x, pos.y);
    line(0, -5, 0, 5);
    popMatrix();
  }
  void update()
  {
    pos.y += yspeed;
    
    if(pos.x < 0 || pos.y < 0 || pos.x > width || pos.y > height)
    {
      rockets.remove(this);
    }
  }
}