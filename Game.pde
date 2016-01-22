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
    drawScorePowerUp();
    drawAmmoPowerUp();
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
  
  void drawAmmoPowerUp()
  {
    for (int i = 0; i < ammos.size(); i++)
    {
      AmmoPower pow = ammos.get(i);
      fill(pow.colour);
      pow.render();
      pow.update();
      pow.paddleCollision();
    }
  }
  
  void drawScorePowerUp()
  {
    for (int i = 0; i < scores.size(); i++)
    {
      ScorePower score = scores.get(i);
      fill(score.colour);
      score.render();
      score.update();
      score.paddleCollision();
    }
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
      ((Power) ball).scoreAdd((Game) game);
    }
  }

  /*

   COMMENTED OUT FUNCTION WORKS. TESTING FUNCTION BELOW THIS ONE
   
   */

  //void ballCollisions()
  //{
  //  for (int i = 0; i < blocks.size(); i++)
  //  {
  //    Block block = blocks.get(i);
  //    //bottom
  //    if ((ball.pos.x >= (block.pos.x - block.halfBlockWidth)) && (ball.pos.x <= (block.pos.x + block.halfBlockWidth)) && ((ball.pos.y - ball.halfB) <= (block.pos.y + block.halfBlockHeight)) && (ball.pos.y > block.pos.y))
  //    {
  //      ball.yspeed = -(ball.yspeed);
  //      ((Power) block).scoreAdd((Game) game);
  //      blocks.remove(block);
  //    }
  //    //top side of block
  //    if ((ball.pos.x >= block.pos.x - block.halfBlockWidth) && (ball.pos.x <= block.pos.x + block.halfBlockWidth) && (ball.pos.y + ball.halfB >= block.pos.y - block.halfBlockHeight) && (ball.pos.y < block.pos.y))
  //    {
  //      ball.yspeed = -(ball.yspeed);  
  //      ((Power) block).scoreAdd((Game) game);
  //      blocks.remove(block);
  //    }
  //    //left side of block
  //    if ((ball.pos.y) >= (block.pos.y - block.halfBlockHeight) && (ball.pos.y) <= (block.pos.y + block.halfBlockHeight) && (ball.pos.x + ball.halfB) >= (block.pos.x - block.halfBlockWidth) && (ball.pos.x < block.pos.x))
  //    {
  //      ball.xspeed = -(ball.xspeed);   
  //      ((Power) block).scoreAdd((Game) game);
  //      blocks.remove(block);
  //    }
  //    //right side
  //    if ((ball.pos.y) >= (block.pos.y - block.halfBlockHeight) && (ball.pos.y) <= (block.pos.y + block.halfBlockHeight) && (ball.pos.x - ball.halfB) <= (block.pos.x + block.halfBlockWidth) && (ball.pos.x > block.pos.x))
  //    {
  //      ball.xspeed = -(ball.xspeed); 
  //      ((Power) block).scoreAdd((Game) game);
  //      blocks.remove(block);
  //    }
  //  }
  //}

  /*

   THIS ONE IS THE PROBLEM. 
   REFER TO BALL AND BLOCK CLASSES. PROBLEM MIGHT LIE THERE BUT CAN'T FIND IT
   
   */
  void ballCollisions()
  {
  for (int i = 0; i < blocks.size(); i++)
  {
    Block block = blocks.get(i);
    //bottom of block
    if ((ball.pos.x >= block.left) && (ball.pos.x <= block.right) && (ball.top <= block.bottom) && (ball.pos.y > block.pos.y))
    {
      ball.yspeed = -(ball.yspeed);

      blocks.remove(block);
      println("bottom");
    }
    //top side of block
    if ((ball.pos.x >= block.left) && (ball.pos.x <= block.right) && (ball.bottom >= block.top) && (ball.pos.y < block.pos.y))
    {
      ball.yspeed = -(ball.yspeed);  

      blocks.remove(block);
      println("top");
    }
    //left side of block
    if ((ball.pos.y >= block.top) && (ball.pos.y <= block.bottom) && (ball.right >= block.left) && (ball.pos.x < block.pos.x))
    {
      ball.xspeed = -(ball.xspeed);   

      blocks.remove(block);
      println("left");
    }
    //right side
    if ((ball.pos.y >= block.top) && (ball.pos.y <= block.bottom) && (ball.left <= block.right) && (ball.pos.x > block.pos.x))
    {
      ball.xspeed = -(ball.xspeed); 
      blocks.remove(block);
      println("right");
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
    }//end for
  }//end rocketCol
}//end class