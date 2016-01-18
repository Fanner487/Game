abstract class Sprite
{
  float left;
  float right;
  float top;
  float bottom;
  float xspeed;
  float yspeed;
 
  float theta = 0.0f;
  
  
  PVector pos;
  PVector forward;
  color colour;
  
  Sprite()
  {
  }
  
  abstract void update();
  abstract void render();
}