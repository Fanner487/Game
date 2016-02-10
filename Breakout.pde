/*
  Student: Eamon Tang
 Number: C14383761
 */
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import controlP5.*;
ControlP5 cp5;
Minim minim;

ArrayList<Sprite> sprites;
Paddle paddle;
Ball ball;
Game game;
Menu menu;
Collision collision;

boolean menushow;
boolean gameover;
boolean playflag;
boolean pauseflag;
boolean unpauseflag;
boolean instructflag;
boolean backMenu;

AudioPlayer buttonPress;

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
  paddle = new Paddle((width/2), (height - 50));
  ball = new Ball(width / 2, 600);

  menushow = true;
  gameover = false;
  playflag = false;

  buttonPress = minim.loadFile("buttonpress.mp3");
}


void draw() {
  background(0);

  if (menushow == true)
  {
    menu.menushow();
  }


  if (playflag == true)
  {
    if (menu.resetScore == true)
    {
      game.score = 0;
      menu.resetScore = false;
    }

    menu.quitshow();
    game.drawSprites();
    collision.check();
    game.randomPower();
    game.levelUpCheck();
    game.render();
  }

  if (gameover == true)
  {
    game.reset();
    menu.gameover();
    menu.menushow();
  }

  if (pauseflag == true)
  {
    game.pauseGame();
    menu.unpauseshow();
  }

  if (unpauseflag == true)
  {
    //when countdown is finished, resume game
    if (game.countdown() == 0)
    {
      game.timer = 179;
      game.second = 3;
      playflag = true;
      unpauseflag = false;
    }
  }

  if (instructflag == true)
  {
    menu.showInstructions();
    menu.flipInstructionButtons();
  }

  if (backMenu == true)
  {
    menu.backToMainMenu();
    backMenu = false;
  }
}//end draw

//controls flags when buttons pressed
void controlEvent(ControlEvent theEvent)
{

  if (theEvent.getName().equals("Play")) {
    menushow = false;
    playflag = true;
    gameover = false;
    pauseflag = false;
    unpauseflag = false;
    instructflag = false;
   
  }

  if (theEvent.getName().equals("Quit")) {
    menushow = true;
    gameover = true;
    playflag = false;
    pauseflag = false;
    unpauseflag = false;
    instructflag = false;
  }

  if (theEvent.getName().equals("Pause")) {
    unpauseflag = false;
    pauseflag = true;
    menushow = false;
    playflag = false;
    gameover = false;
    instructflag = false;
  }

  if (theEvent.getName().equals("Continue")) {
    unpauseflag = true;
    pauseflag = false;
    menushow = false;
    playflag = false;
    gameover = false;
    instructflag = false;
  }

  if (theEvent.getName().equals("Instructions")) {
    instructflag = true;
    unpauseflag = false;
    pauseflag = false;
    menushow = false;
    playflag = false;
    gameover = false;
  }

  if (theEvent.getName().equals("Main Menu")) {
    menushow = true;
    instructflag = false;
    unpauseflag = false;
    pauseflag = false;
    playflag = false;
    gameover = false;
  }

  //plays button sound every time button pressed
  buttonPress.rewind();
  buttonPress.play();
}