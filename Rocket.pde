class Rocket extends Sprite
{
  float speed;
  Rocket(float x, float y, color colour)
  {
    this.pos = new PVector(x, y);
    this.colour = colour;
    speed = 10;
    yspeed = speed;
  }
  Rocket(){
  }
  
  void render()
  {
    stroke(colour);
    fill(colour);
    
    pushMatrix();
    translate(pos.x, pos.y);
    line(0, 0, 0, -10);
    popMatrix();
  }
  void update()
  {
    this.pos.y -= yspeed;
    
    if(pos.x < 0 || pos.y < 0 || pos.x > width || pos.y > height)
    {
      rockets.remove(this);
    }
  }
}