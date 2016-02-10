//controls game field, scores and level ups
class Game extends Sprite implements Sound
{
  //Put sound and ball collision in different function

  int level;
  int score;
  float border;
  int second;
  int wait;
  float gameSpace;
  float halfGameSpace;
  int timer;
  int blockLimit;
  

  AudioPlayer levelup;
  AudioPlayer count;


  Game()
  {  
    score = 0;
    border = width * 0.1f;
    wait = 179;
    level = 0;
    levelup = minim.loadFile("levelup.mp3");
    count = minim.loadFile("count.mp3");
    second = 4;
    gameSpace = width - border;
    halfWidth = gameSpace / 2;
    halfGameSpace = width - halfWidth;
    timer = 179;
    blockLimit = 0;
    
  }
  
  void render() {
    
    stroke(255);
    fill(255);
    drawBox(150, color(255), "Score", score);  
    drawBox(250, color(0, 255, 0), "Ammo", paddle.ammo);  
    drawBox(350, color(255), "Level", level - 1);
    
    //draw left border
    line(game.border, 0, game.border, height);
  }
  
  //taking parameters from render to display scores/ammo/level in boxes
  void drawBox(int y, color c, String text, int value)
  {
    float x = border - 60;
    float left = x - 50;
    float right = x + 50;
    float top = y - 40;
    float bottom = y + 50;
    
    stroke(c);
    fill(c);
    line(left, bottom, right, bottom);
    line(left, top, right, top);
    line(left, top, left, bottom);
    line(right, top, right, bottom);
    text(text + ":\n" + value, x, y);
    
  }
  
  //removes blocks and resets ball speed after gameover
  void reset()
  {
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite block = sprites.get(i);

      if (block instanceof Block)
      {
        sprites.remove(block);
      }
    }

    level = 1;
    ball.xspeed = 3;
    ball.yspeed = 3;

    paddle.ammo = 3;
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
  } 

  void blockGen()
  {
    
    if (noBlocksLeft() && wait < 180) {
      wait++;

      if (wait % 60 == 0)
      {
        second --;
        play(count);
      }

      levelUpText(second);

      ball.stopBall();      //
      removePower();        //remove score/ammo powerups

      //only plays after level 1 completed
      if (wait == 1 && level != 1)
      {
        
        this.play(levelup);
      }

      if (wait==180) 
      {
        wait =0;
        second = 3;

        if (level >= 7)
        {
          blockLimit = 7;
        } else
        {
          blockLimit = level;
        }
        //generate blocks
        for (int i = 0; i < blockLimit; i++)
        {
          //change this
          Block b = new Block((int)random(game.border + 30, 1000), 50 + (50 * i), color(random(255), random(255), random(255)), 3 + (0.5 * level));
          sprites.add(b);
        }

        level ++;

        ball.speedUp();
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
        powerup = new ScorePower((int) random(game.border + 10, 1300));
        break;
      case 1:
        powerup = new AmmoPower((int) random(game.border + 10, 1300));
        break;
      }
      sprites.add(powerup);
    }
  }

  boolean noBlocksLeft()
  {
    boolean isEmpty = false;
    int n = 0;
    
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite b = sprites.get(i);

      if (b instanceof Block)
      {
        n++;
      }
    }
    
    if(n == 0){  isEmpty = true;  }
    else{        isEmpty = false; }
    
    return isEmpty;    
  }

  int countdown()
  {
    pauseGame();
    if (timer == 0)
    {
      wait = 179;
      second = 3;
    }
    if (timer >= 0)
    {
      if (timer % 60 == 0)
      {
        second --;
        play(count);
      }

      timer --;
    }

    fill(255);
    text("Resuming in\n..." + second, halfGameSpace, 350);
    
    return timer;
  }

  //stops all updating and only shows sprites at current position
  void pauseGame() {
    for (int i = 0; i < sprites.size(); i++) {
      Sprite s = sprites.get(i);
      s.render();
      ball.render();
      paddle.render();
    }
    
    menu.pause.hide();
    
    if(unpauseflag == false)
    {
      stroke(255);
      fill(255);
      text("Paused", halfGameSpace, height / 2);
    }    
  }
  
  //displays level up sequence
  void levelUpText(int second)
  {
    fill(255);
    if (level == 1)
    {
      text("Get Ready\n" + second, 750, 350);
    } else
    {
      text("Level " + (level - 1) + " Complete\n Preparing next level\n..." + second, halfGameSpace, 350);
    }
  }
  
    
  void play(AudioPlayer sound)
  {
    sound.rewind();
    sound.play();
  }
  
  void update() {
  }
}//end class