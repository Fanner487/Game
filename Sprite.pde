abstract class Sprite
{
  float left;
  float right;
  float top;
  float bottom;
  int speed;
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
}