class Menu implements Sound
{
  Button play;
  Button quit;
  Button pause;
  Button unpause;
  Button backToMenu;
  Button instructions;
  boolean resetScore;
  AudioPlayer menuSong;
  String[] lines;
  
  Menu()
  {
    
    play = cp5.addButton("Play").setPosition(500, 500).setSize(100, 50).setColorBackground( color( 255,0,0 ) );
    quit = cp5.addButton("Quit").setPosition(10, 650).setSize(100, 50);
    pause = cp5.addButton("Pause").setPosition(10, 600).setSize(100, 50);
    unpause = cp5.addButton("Continue").setPosition(10, 600).setSize(100, 50);
    backToMenu = cp5.addButton("Main Menu").setPosition(700, 500).setSize(100, 50).setColorBackground( color( 255,0,0 ) );
    instructions = cp5.addButton("Instructions").setPosition(600, 500).setSize(100, 50).setColorBackground( color( 255,0,0 ) );
    menuSong = minim.loadFile("sample.mp3");
    play.hide();
    quit.hide();
    pause.hide();
    unpause.hide();
    backToMenu.hide();
    instructions.hide();
    lines = loadStrings("text.txt");
    
    
    
  }
  
  void backToMainMenu()
  {
    backToMenu.hide();
  }
  void unpauseshow()
  {
    unpause.show();
    pause.hide();
  }
  
  void instructionShow()
  {
    instructions.hide();
    backToMenu.show();
  }
  
  void showInstructions()
  {
    for(int i = 0; i < lines.length; i++)
    {
      text(lines[i], width / 2, 50 + (50 * i));
      
    }
  }
  
  void menushow()
  {
    play.show();
    instructions.show();
    backToMenu.hide();
    quit.hide();
    pause.hide();
    
    playflag = false;
    unpause.hide();
   play(menuSong);
  }
  
  void quitshow()
  {
    play.hide();
    quit.show();
    pause.show();
    unpause.hide();
    
    instructions.hide();
    backToMenu.hide();
    //maybe change this
    menuSong.pause();
    menuSong.rewind();
     
    gameover = false;
    
    
  }
  
  void gameover()
  {
    play.show();
    quit.hide();
    pause.hide();
    unpause.hide();
    ball.stopBall();
    resetScore = true;

    
    text("Game Over!\nScore: " + game.score, 750, 350);
  }
  void play(AudioPlayer sound)
  {
    //sound.rewind();
    sound.play();
  }
}