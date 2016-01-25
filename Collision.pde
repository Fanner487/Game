class Collision
{
  void check()
  {
    checkPaddle();
    rocketCollisions();
    ballCollisions();
    ammoPowerCollision();
    scorePowerCollision();
  }

  void ammoPowerCollision()
  {
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite paddle = sprites.get(i);
      if (paddle instanceof Paddle)
      {
        for (int j = 0; j < sprites.size(); j++)
        {
          Sprite ammo = sprites.get(j);
          if (ammo instanceof AmmoPower)
            if ((ammo.pos.y >= paddle.top) && (ammo.pos.x >= paddle.left) && (ammo.pos.x <= paddle.right))
            {
              ((Power) ammo).ammoAdd((Paddle) paddle);
              sprites.remove(ammo);
            }
        }
      }
    }
  }

  void scorePowerCollision()
  {
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite paddle = sprites.get(i);
      if (paddle instanceof Paddle)
      {
        for (int j = 0; j < sprites.size(); j++)
        {
          Sprite score = sprites.get(j);
          if (score instanceof ScorePower)
            if ((score.pos.y >= paddle.top) && (score.pos.x >= paddle.left) && (score.pos.x <= paddle.right))
            {
              ((Power) score).scoreAdd((Game) game);
              sprites.remove(score);
            }
        }
      }
    }
  }


  //paddle collision
  void checkPaddle() 
  {
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite ball = sprites.get(i);

      if (ball instanceof Ball)
      {
        for (int j = 0; j < sprites.size(); j++)
        {
          Sprite paddle = sprites.get(j);

          if (paddle instanceof Paddle)
          {
            if ((ball.pos.x >= paddle.left) && (ball.pos.x <= paddle.right) && (ball.bottom >= paddle.top))
            {
              ball.yspeed = -(ball.yspeed);
              ((Power) ball).scoreAdd((Game) game);
            }
          }
        }
      }
    }
  }


  void ballCollisions()
  {

    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite block = sprites.get(i);

      if (block instanceof Block)
      {
        //bottom of block
        if ((ball.pos.x >= block.left) && (ball.pos.x <= block.right) && (ball.top <= block.bottom) && (ball.pos.y > block.pos.y))
        {
          ball.yspeed = -(ball.yspeed);
          ((Power) block).scoreAdd((Game) game);
          sprites.remove(block);
          println("bottom");
        }
        //top side of block
        if ((ball.pos.x >= block.left) && (ball.pos.x <= block.right) && (ball.bottom >= block.top) && (ball.pos.y < block.pos.y))
        {
          ball.yspeed = -(ball.yspeed);  
          ((Power) block).scoreAdd((Game) game);
          sprites.remove(block);
          println("top");
        }
        //left side of block
        if ((ball.pos.y >= block.top) && (ball.pos.y <= block.bottom) && (ball.right >= block.left) && (ball.pos.x < block.pos.x))
        {
          ball.xspeed = -(ball.xspeed);   
          ((Power) block).scoreAdd((Game) game);
          sprites.remove(block);
          println("left");
        }
        //right side
        if ((ball.pos.y >= block.top) && (ball.pos.y <= block.bottom) && (ball.left <= block.right) && (ball.pos.x > block.pos.x))
        {
          ball.xspeed = -(ball.xspeed); 
          ((Power) block).scoreAdd((Game) game);
          sprites.remove(block);
          println("right");
        }
      }
    }
  }


  void rocketCollisions()
  {
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite rocket = sprites.get(i);

      if (rocket instanceof Rocket)
      {
        for (int j = 0; j < sprites.size(); j++)
        {
          Sprite block = sprites.get(j);
          if (block instanceof Block)
          {
            if (rocket.pos.x <= block.right && rocket.pos.x >= block.left && rocket.pos.y <= block.bottom && rocket.pos.y >= block.top)
            {
              ((Power) block).scoreAdd((Game) game);
              sprites.remove(rocket);
              sprites.remove(block);
            }
          }
        }
      }
    }//end for
  }//end rocketCol
}