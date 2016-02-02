class Menu
{
  Button play;
  Button back;
  Menu()
  {
    //cp5 = new ControlP5();
    play = cp5.addButton("Play").setPosition(500, 500).setSize(100, 50);
    back = cp5.addButton("Back").setPosition(10, 650).setSize(100, 50);
    play.hide();
    back.hide();
    
  }
  
  
  
  void menushow()
  {
    play.show();
    back.hide();
  }
  void backshow()
  {
    play.hide();
    back.show();
  }
  
  
}