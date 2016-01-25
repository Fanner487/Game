abstract class Sprite
{
  float left;
  float right;
  float top;
  float bottom;
  int speed;
  float xspeed;
  float yspeed;
  int size;       // ????
  float halfWidth;
  float halfHeight;
  
 
  float theta = 0.0f;
  
  
  PVector pos;
  PVector forward; /// ?????
  color colour;
  
  Sprite()
  {
  }
  
  abstract void update();
  abstract void render();
}