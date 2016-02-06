import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;

import controlP5.*;
ControlP5 cp5;
/*
IDEAS: explosion with the rockets. Have a new class for that
 Power ups can be random. E.g. 2 bullets or 10 score power
 Maybe change collisions? Paddle collisions. Don't let ball bounce from bottom
 Merging blocks that make more. Make blocks bounce off each other too
 Background changes during moments?
 
 
 special block or sprite. more points if hit
 Set random distance 
 stop shooting rockets. 
 Choose paddle/ball colour?
 Change speed thingies
 
 Remove blocks when back pressed. Only pauses them
 */

void setup()
{
  size(1366, 700);
  rectMode(CENTER);
  textAlign(RIGHT);
  
  minim = new Minim(this);
  cp5 = new ControlP5(this);
  sprites = new ArrayList<Sprite>();
  
  menu = new Menu();
  game = new Game();
  sprites.add(game);
  collision = new Collision();
  paddle = new Paddle((width/2), (height - 50), color(random(255), random(255), random(255)));
  ball = new Ball(width / 2, 500, color(random(255), random(255), random(255)));
  
  menushow = true;
  gameover = false;
  playflag = false;
}

ArrayList<Sprite> sprites;
boolean menushow;
boolean gameover;
boolean playflag;
boolean pauseflag;
boolean unpauseflag;

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
  println("Menushow: " + menushow);
  println("Gameover: " + gameover);
  println("Playflag: " +playflag);

  if(playflag == true)
  {
    if(menu.resetScore == true)
    {
      game.score = 0;
      menu.resetScore = false;
    }
    
    menu.backshow();
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
    playflag = true;
    unpauseflag = false;
  }
  
}//end draw

void controlEvent(ControlEvent theEvent)
{
  if (theEvent.getName().equals("Play")) {
    menushow = false;
    playflag = true;
    gameover = false;
    pauseflag = false;
    unpauseflag = false;
  }
  if (theEvent.getName().equals("Back")) {
    menushow = true;
    playflag = false;
    gameover = false;
    pauseflag = false;
    unpauseflag = false;
    
  }
  
  if(theEvent.getName().equals("Pause")){
    unpauseflag = false;
    pauseflag = true;
    menushow = false;
    playflag = false;
    gameover = false;
  }
  if(theEvent.getName().equals("Continue")){
    unpauseflag = true;
    pauseflag = false;
    menushow = false;
    playflag = false;
    gameover = false;
  }
}