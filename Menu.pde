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
    
    menuSong.play();
  }
  void backshow()
  {
    play.hide();
    back.show();
    menuSong.pause();
    menuSong.rewind();
  }
  
  
}