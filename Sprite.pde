abstract class Sprite
{
  PVector pos;
  color colour;
  
  Sprite()
  {
  }
  
  abstract void update();
  abstract void render();
}