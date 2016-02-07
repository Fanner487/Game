class Rocket extends Sprite
{
  Rocket(float x, float y, color colour)
  {
    super(x, y, colour);
    speed = 10;
    yspeed = speed;
  }
 

  void render()
  {
    stroke(colour);
    fill(colour);
    
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(255);
    fill(colour);
    line(0, 0, 0, 10);
    popMatrix();
  }
  
  void update()
  {
    this.pos.y -= yspeed;
    
    //border control
    if(pos.x < 0 || pos.y < 0 || pos.x > width || pos.y > height)
    {
      sprites.remove(this);
    }
  }
}