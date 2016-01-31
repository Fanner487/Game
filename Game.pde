class Game extends Sprite
{
  //Have borders in here
  int level;
  int score;
  float border;
  float leftBorder;
  float rightBorder;
  boolean allBlocksGone;
  int wait;
  boolean levelFinished;

  void render() {
  }
  void update() {
  }
  Game()
  {
    score = 0;
    border = width * 0.1f;
    allBlocksGone = true;
    wait = 199;
    levelFinished = false;
    level = 0;
    
    
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
    
    if (game.noBlocks() == 0)
    {
     allBlocksGone = true;
     
    }

    if (allBlocksGone == true && wait<200) {
    
      wait++;
      
      
           
      ball.stopBall();
      removePower();
      if (this.wait==200) {
        wait =0;

        //generate blocks
        for (int i = 0; i < 7; i++)
        {
          //change this
          Block b = new Block((int)random(game.border + 30, 1000), 100 + (50 * i), color(random(255), random(255), random(255)));
          sprites.add(b);
        }
        
        this.level ++;
        ball.speedUp();
        randomPower();
        
        allBlocksGone = false;
        randomPower();
        
      }
    }
    
  }
  void removePower()
  {
    for(int i = 0; i < sprites.size(); i++)
    {
      Sprite power = sprites.get(i);
      
      if(power instanceof AmmoPower || power instanceof ScorePower)
      {
        sprites.remove(power);
      }
    }
  }
  
  void randomPower()
  {
    if (frameCount % 180 == 0)
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