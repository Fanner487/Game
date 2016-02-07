class Block extends Sprite implements Power
{
  int x = 0;
  boolean set = false;

  Block(int x, int y, color colour, float speed)
  {
    super(x, y, colour);
    w = 60;
    h = 20;
    halfWidth = w * 0.5f;
    halfHeight = h * 0.5f;

    x = (int) random(0, 2);
    switch(x)
    {
    case 0:
      this.speed = speed;
      break;
    case 1:
      this.speed = -(speed);
      break;
    }
    //set = true;



    //set = false;
  }


  void add1(Sprite sprite)
  {
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite game = sprites.get(i);

      if (game instanceof Game)
      {
        ((Game) game).score += 5;
      }
    }
  }

  void render() {
    stroke(255);
    fill(colour);
    rect(pos.x, pos.y, w, h);
  }

  void update() {

    pos.x += speed;

    pointUpdate();

    //border collisions
    if (this.right >= width || this.left <= game.border)
    {
      speed = -(speed);
    }
  }
}