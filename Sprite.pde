//abstract class for AmmoPower, Ball, Block, Explosion, Game, Paddle, Power, Rocket, Scorepower.
abstract class Sprite
{
  float left;
  float right;
  float top;
  float bottom;
  float speed;
  int size;
  float xspeed;
  float yspeed;
  float halfWidth;
  float halfHeight; 
  float w;
  float h;
  float theta = 0.0f;
  PVector pos; 
  color colour;
  
  Sprite(float x, float y, color colour)
  {
    pos = new PVector(x, y);
    this.colour = colour;
  }
  
  Sprite()
  {
  }
  
  abstract void update();
  abstract void render();
  
  //updates respective end points of sprites e.g blocks/paddle etc in update methods
  void pointUpdate()
  {
    left = pos.x - halfWidth;
    right = pos.x + halfWidth;
    top = pos.y - halfHeight;
    bottom = pos.y + halfHeight;
  }
}