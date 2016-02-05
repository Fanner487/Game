class Game extends Sprite
{
  //Put sound and ball collision in different function
  
  
  
  int level;
  int score;
  float border;
  boolean allBlocksGone;
  
  int wait;
  AudioPlayer levelup;


  Game()
  {
    score = 0;
    border = width * 0.1f;
    allBlocksGone = true;
    wait = 199;
    level = 0;
    levelup = minim.loadFile("levelup.mp3");
    
  }

  void render() {
    fill(255);
    text("Score: " + game.score +  "\n" + 
      "rocket ammo: " + paddle.ammo  + "\n" + 
      "blocks: " + game.noBlocks() + "\n" + 
      "Score powerups: " + game.noScorePowers() + "\n" + 
      "Ammo powerups: " + game.noAmmoPowers() +  "\n" + 
      game.wait + "\n" +
      "x: " + ball.xspeed +
      "\ny: " + ball.yspeed + 
      "\n Level: " + game.level, game.border, 50
    );
  }

  void update() {
  }
  
  void reset()
  {
    for(int i = 0; i < sprites.size(); i++)
    {
      Sprite block = sprites.get(i);
      
      if(block instanceof Block)
      {
        sprites.remove(block);
      }
      
    }
    
    //game.score = 0;
    level = 1;
  }

  void drawSprites()
  {
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite s = sprites.get(i);
      s.update();
      s.render();
    }
    paddle.render();
    paddle.update();
    ball.update();
    ball.render();
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
      levelUpText();
      
      if(wait == 1)
      {
        //levelup.rewind();
        //levelup.play();
      }
      
      if (this.wait==200) {
        wait =0;

        //generate blocks
        for (int i = 0; i < level; i++)
        {
          //change this
          Block b = new Block((int)random(game.border + 30, 1000), 50 + (50 * i), color(random(255), random(255), random(255)), 3 + (0.5 * level));
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
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite power = sprites.get(i);

      if (power instanceof AmmoPower || power instanceof ScorePower)
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
  
  void levelUpText()
  {
    fill(255);
    if(level == 1)
    {
      text("Get Ready", 750, 350);
    }
    else
    {
      text("Level " + (level - 1) + " Complete\n Preparing next level", 750, 350);
    }
    
  }
}//end class