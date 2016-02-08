class Collision implements Sound
{
  AudioPlayer rocketCol;
  AudioPlayer paddleBall;
  AudioPlayer scoreSound;
  
  Collision()
  {
    rocketCol = minim.loadFile("rocket.mp3");
    paddleBall = minim.loadFile("paddle.mp3");
    scoreSound = minim.loadFile("scorepower.mp3");
  }


  void check()
  {
    paddle();
    rocket();
    ball();
    ammoPower();
    scorePower();
  }
  
  //collisions between paddle and ammo powerup
  void ammoPower()
  {
    for (int j = 0; j < sprites.size(); j++)
    {
      Sprite ammo = sprites.get(j);
      if (ammo instanceof AmmoPower)
        if ((ammo.pos.y >= paddle.top) && (ammo.pos.x >= paddle.left) && (ammo.pos.x <= paddle.right) && (ammo.pos.y < paddle.pos.y))
        {

          ((Power) ammo).addTo((Paddle) paddle);
          play(scoreSound);
          sprites.remove(ammo);
        }
    }
  }
  
  //collisions between paddle and score powerup
  void scorePower()
  {

    for (int j = 0; j < sprites.size(); j++)
    {
      Sprite score = sprites.get(j);
      if (score instanceof ScorePower)
        if ((score.pos.y >= paddle.top) && (score.pos.x >= paddle.left) && (score.pos.x <= paddle.right) && (score.pos.y < paddle.pos.y))
        {

          ((Power) score).addTo((Game) game);
          play(scoreSound);
          sprites.remove(score);
        }
    }
  }
  
  //paddle and ball collisions
  void paddle() 
  {
    if ((ball.pos.x >= paddle.left) && (ball.pos.x <= paddle.right) && (ball.bottom >= paddle.top) && (ball.pos.y < paddle.pos.y))
    {
      ball.yspeed = -(ball.yspeed);
      play(paddleBall);
      ((Power) ball).addTo((Game) game);
    }
  }

  //collisions between ball and block
  void ball()
  {

    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite block = sprites.get(i);

      if (block instanceof Block)
      {
        //bottom of block
        if ((ball.pos.x >= block.left) && (ball.pos.x <= block.right) && (ball.top <= block.bottom) && (ball.pos.y > block.pos.y))
        {
          //passes into bounce method below with which side as parameter
          bounce("top", block);
          println("bottom");
        }
        //top side of block
        else if ((ball.pos.x >= block.left) && (ball.pos.x <= block.right) && (ball.bottom >= block.top) && (ball.pos.y < block.pos.y))
        {
          bounce("top", block);
          println("top");
        }
        //left side of block
        else if ((ball.pos.y >= block.top) && (ball.pos.y <= block.bottom) && (ball.right >= block.left) && (ball.pos.x < block.pos.x))
        {
          bounce("side", block);
          println("left");
        }
        //right side
        else if ((ball.pos.y >= block.top) && (ball.pos.y <= block.bottom) && (ball.left <= block.right) && (ball.pos.x > block.pos.x))
        {
          bounce("side", block);
          println("right");
        }
      }
    }
  }

  void bounce(String side, Sprite block)
  {
    //inverts speed value depending on side
    if(side == "side"){
      ball.xspeed = -(ball.xspeed);
    }
    else if(side == "top"){
      ball.yspeed = -(ball.yspeed);
    }
    
    play(paddleBall);
    ((Power) block).addTo((Game) game);
    sprites.remove(block);
       
  }
  
  //between rocket and block
  void rocket()
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

              ((Power) block).addTo((Game) game);
              play(rocketCol);
              Explosion e = new Explosion(block.pos.x, block.pos.y, block.colour);
              sprites.add(e);
              sprites.remove(rocket);
              sprites.remove(block);
              
            }
          }
        }
      }
    }//end for
  }//end rocketCol

  void play(AudioPlayer sound)
  {
    sound.rewind();
    sound.play();
  }
}