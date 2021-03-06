//menu controls for buttons
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
  int bHeight;
  int bWidth;

  Menu()
  {
    bWidth = 135;
    bHeight = 50;
    play = cp5.addButton("Play").setPosition(500, 500).setSize(bWidth, bHeight).setColorBackground( color( 255, 0, 0 )).setColorForeground(color(255, 255, 0)).setColorActive(color(0, 0, 255));
    quit = cp5.addButton("Quit").setPosition(0, 570).setSize(bWidth, bHeight).setColorBackground( color( 255, 0, 0 )).setColorForeground(color(255, 255, 0)).setColorActive(color(0, 0, 255));
    pause = cp5.addButton("Pause").setPosition(0, 500).setSize(bWidth, bHeight).setColorBackground( color( 255, 0, 0 )).setColorForeground(color(255, 255, 0)).setColorActive(color(0, 0, 255));
    unpause = cp5.addButton("Continue").setPosition(0, 500).setSize(bWidth, bHeight).setColorBackground( color( 255, 0, 0 )).setColorForeground(color(255, 255, 0)).setColorActive(color(0, 0, 255));
    backToMenu = cp5.addButton("Main Menu").setPosition(700, 500).setSize(bWidth, bHeight).setColorBackground( color( 255, 0, 0 )).setColorForeground(color(255, 255, 0)).setColorActive(color(0, 0, 255));
    instructions = cp5.addButton("Instructions").setPosition(700, 500).setSize(bWidth, bHeight).setColorBackground( color( 255, 0, 0 )).setColorForeground(color(255, 255, 0)).setColorActive(color(0, 0, 255));
    menuSong = minim.loadFile("sample.mp3");
    play.hide();
    quit.hide();
    pause.hide();
    unpause.hide();
    backToMenu.hide();
    instructions.hide();
    lines = loadStrings("text.txt"); //holds instructions in data folder
  }
  
  //shows the play and instructions button
  void menushow()
  {
    play.show();
    instructions.show();
    backToMenu.hide();
    quit.hide();
    pause.hide();

    playflag = false;
    unpause.hide();

    menuSong.play();
    //for(int i = 0; i < 255; i ++)
    stroke(255);
    fill(255, 0, 0);
    text("Breakout", width / 2, 200);
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
  
  //shows instruction button in menu
 
  void flipInstructionButtons()
  {
    instructions.hide();
    backToMenu.show();
  }
  
  //prints instructions using file text.txt
  void showInstructions()
  {
    textSize(30);
    for (int i = 0; i < lines.length; i++)
    {
      stroke(255);
      fill(255);
      text(lines[i], width / 2, 200 + (50 * i));
    }
    textSize(48);
  }
  
  //shows pause and quit buttons during gameplay
  void inGameButtons()
  {
    quit.show();
    pause.show();
    
    play.hide();
    unpause.hide();
    instructions.hide();
    backToMenu.hide();
    menuSong.pause();

    gameover = false;
  }
  
  //shows gameover screen
  void gameover()
  {
    play.show();
    
    quit.hide();
    pause.hide();
    unpause.hide();
    ball.stopBall();
    resetScore = true;
    
    //menuSong.rewind();
    
    //Displays score when game over
    text("Game Over!\nScore: " + game.score, width / 2, height / 2);
  }
  void play(AudioPlayer sound)
  {
    sound.rewind();
    sound.play();
  }
}