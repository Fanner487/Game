class Game
{
  //Have borders in here
  int score;
  float border;
  float leftBorder;
  float rightBorder;

  Game()
  {
    score = 0;
    border = width * 0.1f;
    
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