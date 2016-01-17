abstract class Sprite
{
  float left;
  float right;
  float top;
  float bottom;
  float xspeed;
  float yspeed;
  
  PVector pos;
  color colour;
  
  Sprite()
  {
  }
  
  abstract void update();
  abstract void render();
}