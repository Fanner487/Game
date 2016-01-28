class ScorePower extends Sprite implements Power
{

  ScorePower(int x)
  {
    this.pos = new PVector(x, 20);
    this.colour = color(255, 255, 255);
    size = 7;
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
      sprites.remove(this);
    }
    
    //put this in collisions
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite paddle = sprites.get(i);

      if (paddle instanceof Paddle)
      {
        if ((pos.y >= paddle.top) && (pos.x >= paddle.left) && (pos.x <= paddle.right))
        {

          //((Power) this).scoreAdd((Game) game);
          ((Power) this).add1((Game) game);
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
    noFill();
    rect(0, 0, size, size);
    line(0 - size, 0, 0, 0 - size);
    line(0, 0 - size, 0 + size, 0);
    line(0, 0 + size, 0 + size, 0);
    line(0 - size, 0, 0, 0 + size);
    popMatrix();
  }


  //void ammoAdd(Paddle paddle) {
  //}

  //void scoreAdd(Game game)
  //{
  //  game.score += 5;
  //}
  
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
  
  //interface?
  //void paddleCollision()
  //{
  //  for (int i = 0; i < sprites.size(); i++)
  //  {
  //    Sprite paddle = sprites.get(i);

  //    if (paddle instanceof Paddle)
  //    {
  //      if ((pos.y >= paddle.top) && (pos.x >= paddle.left) && (pos.x <= paddle.right))
  //      {

  //        ((Power) this).scoreAdd((Game) game);
  //        sprites.remove(this);
  //      }
  //    }
  //  }
  //}
}