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
    border = width * 0.07f;
    leftBorder = border;
    rightBorder = width - border;
  }

  void checkCollisions()
  {
    
  }

  void drawSprites()
  {

    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite s = sprites.get(i);
      s.update();
      s.render();
    }
  } 

  
}//end class