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
    //theta += 0.1f;
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
    rotate(theta);
    stroke(255);
    fill(this.colour);
    triangle(0, 10, 10, 10, 5, 0);
    popMatrix();
  }
  
  void addTo(Sprite sprite)
  {
    paddle.ammo ++;
  }

}