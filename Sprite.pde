abstract class Sprite
{
  float left;
  float right;
  float top;
  float bottom;
  
  PVector pos;
  color colour;
  
  Sprite()
  {
  }
  
  abstract void update();
  abstract void render();
}