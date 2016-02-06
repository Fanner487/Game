class Block extends Sprite implements Power
{
 
 
  boolean set = false;
  int x = 0;

  Block(int x, int y, color colour, float speed)
  {
    super(x, y, colour);
    w = 60;
    h = 20;
    halfWidth = w * 0.5f;
    halfHeight = h * 0.5f;

    //speed = 3;
    xspeed = speed;

    
  }


  void add1(Sprite sprite)
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

  void render() {
    stroke(255);
    fill(this.colour);
    rect(pos.x, pos.y, w, h);
  }
  void update() {

    //sets direction for block. May change
    if (set == false)
    {
      //put in function?
      x = (int) random(0, 2);
      set = true;
    }

    if (x == 0)
    {
      pos.x += xspeed;
    } else if (x == 1)
    {
      pos.x += -(xspeed);
    }

    left = pos.x - halfWidth;
    right = pos.x + halfWidth;
    top = pos.y - halfHeight;
    bottom = pos.y + halfHeight;

    if (this.right >= width || this.left <= game.border)
    {
      xspeed = -(xspeed);
    }
  }
}