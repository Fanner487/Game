//powerup for ammo
class AmmoPower extends Sprite implements Power
{

  AmmoPower(int x)
  {
    super(x, 10, color(0, 255, 0));
    size = 10;
    speed = (int)random(3, 6);
  }

  void update()
  {
    
    pos.y += speed;


    if (theta > TWO_PI)
    {
      theta = 0;
    }

    if (pos.y > height)
    {
      sprites.remove(this);
    }
    
  }

  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(255);
    fill(this.colour);
    triangle(10, -10, 20, -10, 15, 0);
    popMatrix();
  }
  
  void addTo(Sprite sprite)
  {
    paddle.ammo ++;
  }

}