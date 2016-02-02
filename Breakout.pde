/*
IDEAS: explosion with the rockets. Have a new class for that
 Power ups can be random. E.g. 2 bullets or 10 score power
 Maybe change collisions? Paddle collisions. Don't let ball bounce from bottom
 Merging blocks that make more. Make blocks bounce off each other too
 Background changes during moments?
 Ball speed ups.
 
 special block or sprite. more points if hit
 Set random distance 
 stop shooting rockets. 
 
 Make a menu
 
 Change speed thingies
 Create buttons in main. Do display and stuff in class
 */

void setup()
{
  size(1366, 700);
  rectMode(CENTER);
  textAlign(RIGHT);

  cp5 = new ControlP5(this);
  sprites = new ArrayList<Sprite>();
  menu = new Menu();

  game = new Game();
  collision = new Collision();

  paddle = new Paddle((width/2), (height - 50), color(random(255), random(255), random(255)));
  ball = new Ball(250, 400, color(random(255), random(255), random(255)));
  sprites.add(paddle);
  sprites.add(ball);
  sprites.add(game);
  x =0;
  menushow = true;
}

ArrayList<Block> blocks;
ArrayList<Rocket> rockets;
ArrayList<ScorePower> scores;
ArrayList<AmmoPower> ammos;
ArrayList<Sprite> sprites;
Paddle paddle;
Ball ball;
Game game;
Menu menu;
Collision collision;
import controlP5.*;
ControlP5 cp5;
int x;
boolean menushow;

void draw() {
  background(0);


  
  if (menushow == true)
  {
    menu.menushow();
  } else {
    menu.backshow();
    game.drawSprites();
    collision.check();
    game.randomPower();
    game.blockGen();
    game.render();
  }
  
}//end draw

void controlEvent(ControlEvent theEvent)
{
  if (theEvent.getName().equals("Play")) {
    menushow = false;
  }
  if (theEvent.getName().equals("Back")) {
    menushow = true;
  }
}