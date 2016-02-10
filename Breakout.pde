import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import controlP5.*;
ControlP5 cp5;
Minim minim;
/*
IDEAS:
 Background changes during moments?
 special block or sprite. more points if hit
 
 remember to set back ammo
 
 */

void setup()
{
  size(1366, 700);
  textSize(20);
  rectMode(CENTER);
  textAlign(CENTER);
  minim = new Minim(this);
  cp5 = new ControlP5(this);
  
  sprites = new ArrayList<Sprite>();
  
  menu = new Menu();
  game = new Game();
  
  sprites.add(game);
  collision = new Collision();
  
  //change to no colour
  paddle = new Paddle((width/2), (height - 50), color(random(255), random(255), random(255)));
  ball = new Ball(width / 2, 600, color(random(255), random(255), random(255)));
  
  menushow = true;
  gameover = false;
  playflag = false;
  
  buttonPress = minim.loadFile("buttonpress.mp3");
}

ArrayList<Sprite> sprites;
boolean menushow;
boolean gameover;
boolean playflag;
boolean pauseflag;
boolean unpauseflag;
boolean instructflag;
boolean backMenu;
AudioPlayer buttonPress;
Paddle paddle;
Ball ball;
Game game;
Menu menu;
Collision collision;


void draw() {
  background(0);
  
  if (menushow == true)
  {
    menu.menushow();       
  }


  if(playflag == true)
  {
    if(menu.resetScore == true)
    {
      game.score = 0;
      menu.resetScore = false;
    }
    
    menu.quitshow();
    game.drawSprites();
    collision.check();
    game.randomPower();
    game.blockGen();
    game.render();
  }
  
  if(gameover == true)
  {
    game.reset();
    menu.gameover();
    menu.menushow();
  }
  
  if(pauseflag == true)
  {
    game.pauseGame();
    menu.unpauseshow();
    
  }
  
  if(unpauseflag == true)
  {
    if(game.countdown() == 0)
    {
      game.timer = 179;
      game.second = 3;
      playflag = true;
      unpauseflag = false;
    }    
  }
  
  if(instructflag == true)
  {
    menu.showInstructions();
    menu.instructionShow();
  }
  
  if(backMenu == true)
  {
    menu.backToMainMenu();
    backMenu = false;
  }
  
}//end draw

//can't inherit fron interface
void p(AudioPlayer sound)
{
  sound.rewind();
  sound.play();
}

void controlEvent(ControlEvent theEvent)
{
  
  if (theEvent.getName().equals("Play")) {
    menushow = false;
    playflag = true;
    gameover = false;
    pauseflag = false;
    unpauseflag = false;
    instructflag = false;
    p(buttonPress);
  }
  
  if (theEvent.getName().equals("Quit")) {
    menushow = true;
    playflag = false;
    gameover = true;
    pauseflag = false;
    unpauseflag = false;
    instructflag = false;
    p(buttonPress);
  }
  
  if(theEvent.getName().equals("Pause")){
    unpauseflag = false;
    pauseflag = true;
    menushow = false;
    playflag = false;
    gameover = false;
    instructflag = false;
    p(buttonPress);
  }
  
  if(theEvent.getName().equals("Continue")){
    unpauseflag = true;
    pauseflag = false;
    menushow = false;
    playflag = false;
    gameover = false;
    instructflag = false;
    p(buttonPress);
  }
  
  if(theEvent.getName().equals("Instructions")){
    instructflag = true;
    unpauseflag = false;
    pauseflag = false;
    menushow = false;
    playflag = false;
    gameover = false;
    p(buttonPress);
  }
  
  if(theEvent.getName().equals("Main Menu")){
    menushow = true;
    instructflag = false;
    unpauseflag = false;
    pauseflag = false;
    playflag = false;
    gameover = false;
    p(buttonPress);
  }
  
  
}