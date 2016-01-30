class Game extends Sprite
{
  //Have borders in here
  int score;
  float border;
  float leftBorder;
  float rightBorder;
  boolean allGone;
  int wait;

  void render() {
  }
  void update() {
  }
  Game()
  {
    score = 0;
    border = width * 0.1f;
    allGone = true;
    wait = 199;
    
    
  }


  void drawSprites()
  {

    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite s = sprites.get(i);
      s.update();
      s.render();
    }

    //draw left border
    line(game.border, 0, game.border, height);
  } 

  void blockGen()
  {

    //float tempX = 0.0f;
    //float tempY = 0.0f;
    
    //for (int i = 0; i < sprites.size(); i++)
    //{
    //  Sprite ball = sprites.get(i);

    //  if (ball instanceof Ball)
    //  {
    //    tempX = ball.xspeed;
    //    tempY = ball.yspeed;
    //    break;
    //  }
    //}

    if (allGone == true && wait<200) {

      wait++;
      ball.pos.x = width /2;
      ball.pos.y = 500;
      ball.xspeed = 0;
      ball.yspeed = 0;
      if (this.wait==200) {
        wait =0;

        //generate blocks
        for (int i = 0; i < 7; i++)
        {
          Block b = new Block((int)random(game.border + 20, 1000), 100 + (50 * i), color(random(255), random(255), random(255)));
          sprites.add(b);
        }

        allGone = false;
        ball.xspeed = 5;
        ball.yspeed = 5;
      }
    }
    //put in game class
    if (game.noBlocks() == 0)
    {
      allGone = true;
    }
  }

  void randomPower()
  {
    if (frameCount % 120 == 0)
    {
      Sprite powerup = null;
      int num = (int) random(0, 2);

      switch(num)
      {
      case 0:
        powerup = new ScorePower((int) random(game.border, 1300));
        break;
      case 1:
        powerup = new AmmoPower((int) random(game.border, 1300));
        break;
      }
      sprites.add(powerup);
    }
  }

  int noBlocks()
  {
    int n = 0;
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite b = sprites.get(i);

      if (b instanceof Block)
      {
        n++;
      }
    }

    return n;
  }

  int noScorePowers()
  {
    int n = 0;
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite b = sprites.get(i);

      if (b instanceof ScorePower)
      {
        n++;
      }
    }

    return n;
  }

  int noAmmoPowers()
  {
    int n = 0;
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite b = sprites.get(i);

      if (b instanceof AmmoPower)
      {
        n++;
      }
    }

    return n;
  }
}//end class