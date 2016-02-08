class Menu implements Sound
{
  Button play;
  Button back;
  Button pause;
  Button unpause;
  boolean resetScore;
  AudioPlayer menuSong;
  Menu()
  {
    
    play = cp5.addButton("Play").setPosition(500, 500).setSize(100, 50);
    back = cp5.addButton("Back").setPosition(10, 650).setSize(100, 50);
    pause = cp5.addButton("Pause").setPosition(10, 600).setSize(100, 50);
    unpause = cp5.addButton("Continue").setPosition(10, 600).setSize(100, 50);
    menuSong = minim.loadFile("sample.mp3");
    play.hide();
    back.hide();
    pause.hide();
    unpause.hide();
    
  }
  
  void play(AudioPlayer sound)
  {
    sound.rewind();
    sound.play();
  }
  void unpauseshow()
  {
    unpause.show();
    pause.hide();
  }
  
  void menushow()
  {
    play.show();
    
    back.hide();
    pause.hide();
    
    playflag = false;
    unpause.hide();
    this.play(menuSong);
  }
  
  void backshow()
  {
    play.hide();
    back.show();
    pause.show();
    unpause.hide();
    
    
    //maybe change this
    menuSong.pause();
    menuSong.rewind();
    
    
    gameover = false;
    
    
  }
  
  void gameover()
  {
    play.show();
    back.hide();
    pause.hide();
    unpause.hide();
    ball.stopBall();
    resetScore = true;

    
    text("Game Over!\nScore: " + game.score, 750, 350);
  }
  
}