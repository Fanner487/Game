//power ups for score
class ScorePower extends Sprite implements Power
{

  ScorePower(int x)
  {
    super(x, 10, color(255,255,255));
    size = 7;
    speed = (int)random(3, 6);
  }

  void update()
  {
    
    theta += 0.1f;
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
    noFill();
    rect(0, 0, size, size);
    line(0 - size, 0, 0, 0 - size);
    line(0, 0 - size, 0 + size, 0);
    line(0, 0 + size, 0 + size, 0);
    line(0 - size, 0, 0, 0 + size);
    popMatrix();
  }

  //adds to score
  void addTo(Sprite sprite)
  {
    for(int i = 0; i < sprites.size(); i++)
    {
      Sprite game = sprites.get(i);
      
      if(game instanceof Game)
      {
        ((Game) game).score += 5;
      }
    }
  }
  
  
}