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
    //drawBlocks();
    //drawRockets();
    //drawScorePowerUp();
    //drawAmmoPowerUp();

    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite s = sprites.get(i);
      s.update();
      s.render();
    }
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

  //paddle collision
  void checkPaddle() 
  {
    if ((ball.pos.x >= paddle.left) && (ball.pos.x <= paddle.right) && (ball.pos.y + ball.halfB >= paddle.top))
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
  //void ballCollisions()
  //{
  //  for (int i = 0; i < blocks.size(); i++)
  //  {
  //    Block block = blocks.get(i);
  //    //bottom of block
  //    if ((ball.pos.x >= block.left) && (ball.pos.x <= block.right) && (ball.top <= block.bottom) && (ball.pos.y > block.pos.y))
  //    {
  //      ball.yspeed = -(ball.yspeed);

  //      blocks.remove(block);
  //      println("bottom");
  //    }
  //    //top side of block
  //    if ((ball.pos.x >= block.left) && (ball.pos.x <= block.right) && (ball.bottom >= block.top) && (ball.pos.y < block.pos.y))
  //    {
  //      ball.yspeed = -(ball.yspeed);  

  //      blocks.remove(block);
  //      println("top");
  //    }
  //    //left side of block
  //    if ((ball.pos.y >= block.top) && (ball.pos.y <= block.bottom) && (ball.right >= block.left) && (ball.pos.x < block.pos.x))
  //    {
  //      ball.xspeed = -(ball.xspeed);   

  //      blocks.remove(block);
  //      println("left");
  //    }
  //    //right side
  //    if ((ball.pos.y >= block.top) && (ball.pos.y <= block.bottom) && (ball.left <= block.right) && (ball.pos.x > block.pos.x))
  //    {
  //      ball.xspeed = -(ball.xspeed); 
  //      blocks.remove(block);
  //      println("right");
  //    }
  //  }
  //}

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

          sprites.remove(block);
          println("bottom");
        }
        //top side of block
        if ((ball.pos.x >= block.left) && (ball.pos.x <= block.right) && (ball.bottom >= block.top) && (ball.pos.y < block.pos.y))
        {
          ball.yspeed = -(ball.yspeed);  

          sprites.remove(block);
          println("top");
        }
        //left side of block
        if ((ball.pos.y >= block.top) && (ball.pos.y <= block.bottom) && (ball.right >= block.left) && (ball.pos.x < block.pos.x))
        {
          ball.xspeed = -(ball.xspeed);   

          sprites.remove(block);
          println("left");
        }
        //right side
        if ((ball.pos.y >= block.top) && (ball.pos.y <= block.bottom) && (ball.left <= block.right) && (ball.pos.x > block.pos.x))
        {
          ball.xspeed = -(ball.xspeed); 
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
}//end class