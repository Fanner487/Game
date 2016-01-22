class ScorePower extends Sprite implements Power
{

  ScorePower(int x)
  {
    this.pos = new PVector(x, 20);
    this.colour = color(255, 255, 255);
    size = 10;
    speed = 5;
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
      pos.y = 0;
    }
    
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite paddle = sprites.get(i);

      if (paddle instanceof Paddle)
      {
        if ((pos.y >= paddle.top) && (pos.x >= paddle.left) && (pos.x <= paddle.right))
        {

          ((Power) this).scoreAdd((Game) game);
          sprites.remove(this);
        }
      }
    }
  }

  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    stroke(255);
    fill(this.colour);
    rect(0, 0, size, size);
    popMatrix();
  }


  void ammoAdd(Paddle paddle) {
  }

  void scoreAdd(Game game)
  {
    game.score += 5;
  }

  //interface?
  void paddleCollision()
  {
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite paddle = sprites.get(i);

      if (paddle instanceof Paddle)
      {
        if ((pos.y >= paddle.top) && (pos.x >= paddle.left) && (pos.x <= paddle.right))
        {

          ((Power) this).scoreAdd((Game) game);
          sprites.remove(this);
        }
      }
    }
  }
}