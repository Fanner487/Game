class Game
{
  //Have borders
  //hold collisions here
  int score;

  Game()
  {
    score = 0;
  }

  void checkCollisions()
  {
    checkPaddle();
    rocketCollisions();
    ballCollisions();
  }

  void drawSprites()
  {
    drawBallPaddle();
    drawBlocks();
    drawRockets();
  } 
  void drawBallPaddle()
  {
    fill(paddle.colour);
    paddle.update();
    paddle.render();

    fill(ball.colour);
    ball.update();
    ball.render();
  }

  void drawBlocks()
  {
    for (int i = 0; i < blocks.size(); i++)
    {

      Block block = blocks.get(i);
      fill(block.colour);
      block.render();
      block.update();
    }
  }

  void drawRockets()
  {
    for (int i = 0; i < rockets.size(); i++)
    {
      Rocket rocket = rockets.get(i);

      rocket.render();
      rocket.update();
    }
  }

  //paddle collision
  void checkPaddle() 
  {
    if ((ball.pos.x >= paddle.pos.x - paddle.halfPWidth) && (ball.pos.x <= paddle.pos.x + paddle.halfPWidth) && (ball.pos.y + ball.halfB >= paddle.pos.y - paddle.halfPHeight))
    {
      ball.yspeed = -(ball.yspeed);
    }
  }

  /*

   COMMENTED OUT FUNCTION WORKS. TESTING FUNCTION BELOW THIS ONE
   
   */

  void ballCollisions()
  {
    for (int i = 0; i < blocks.size(); i++)
    {
      Block block = blocks.get(i);
      //bottom
      if ((ball.pos.x >= (block.pos.x - block.halfBlockWidth)) && (ball.pos.x <= (block.pos.x + block.halfBlockWidth)) && ((ball.pos.y - ball.halfB) <= (block.pos.y + block.halfBlockHeight)) && (ball.pos.y > block.pos.y))
      {
        ball.yspeed = -(ball.yspeed);
        ((Power) block).scoreAdd((Game) game);
        blocks.remove(block);
      }
      //top side of block
      if ((ball.pos.x >= block.pos.x - block.halfBlockWidth) && (ball.pos.x <= block.pos.x + block.halfBlockWidth) && (ball.pos.y + ball.halfB >= block.pos.y - block.halfBlockHeight) && (ball.pos.y < block.pos.y))
      {
        ball.yspeed = -(ball.yspeed);  
        ((Power) block).scoreAdd((Game) game);
        blocks.remove(block);
      }
      //left side of block
      if ((ball.pos.y) >= (block.pos.y - block.halfBlockHeight) && (ball.pos.y) <= (block.pos.y + block.halfBlockHeight) && (ball.pos.x + ball.halfB) >= (block.pos.x - block.halfBlockWidth) && (ball.pos.x < block.pos.x))
      {
        ball.xspeed = -(ball.xspeed);   
        ((Power) block).scoreAdd((Game) game);
        blocks.remove(block);
      }
      //right side
      if ((ball.pos.y) >= (block.pos.y - block.halfBlockHeight) && (ball.pos.y) <= (block.pos.y + block.halfBlockHeight) && (ball.pos.x - ball.halfB) <= (block.pos.x + block.halfBlockWidth) && (ball.pos.x > block.pos.x))
      {
        ball.xspeed = -(ball.xspeed); 
        ((Power) block).scoreAdd((Game) game);
        blocks.remove(block);
      }
    }
  }

  void rocketCollisions()
  {
    for (int i = 0; i < rockets.size(); i++)
    {
      Rocket rocket = rockets.get(i);

      if (rocket instanceof Rocket)
      {
        for (int j = 0; j < blocks.size(); j++)
        {
          Block block = blocks.get(j);
          if (block instanceof Block)
          {
            if (rocket.pos.x <= block.pos.x + block.halfBlockWidth && rocket.pos.x >= block.pos.x - block.halfBlockWidth && rocket.pos.y <= block.pos.y + block.halfBlockHeight && rocket.pos.y >= block.pos.y - block.halfBlockHeight)
            {
              ((Power) block).scoreAdd((Game) game);
              rockets.remove(rocket);
              blocks.remove(block);
            }
          }
        }
      }
    }
  }
}//end class