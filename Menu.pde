class Menu
{
  Button play;
  Button back;
  AudioPlayer menuSong;
  Menu()
  {
    
    play = cp5.addButton("Play").setPosition(500, 500).setSize(100, 50);
    back = cp5.addButton("Back").setPosition(10, 650).setSize(100, 50);
    menuSong = minim.loadFile("sample.mp3");
    play.hide();
    back.hide();
    
  }
    
  void menushow()
  {
    play.show();
    back.hide();
    
    playflag = false;
    //menuSong.play();
  }
  
  void backshow()
  {
    play.hide();
    back.show();
    menuSong.pause();
    menuSong.rewind();
    gameover = false;
    
    
  }
  
  void gameover()
  {
    //play.show();
    back.hide();
    ball.stopBall(); //make a reset thingy
    
   // menushow = true;
    
    text("Game Over!\nScore: " + game.score, 750, 350);
  }
  
}