/*
IDEAS: explosion with the rockets. Have a new class for that
 Power ups can be random. E.g. 2 bullets or 10 score power
 Maybe change collisions? Paddle collisions. Don't let ball bounce from bottom
 Merging blocks that make more. Make blocks bounce off each other too
 Background changes during moments?
 Ball speed ups.
 
 
 Put border on left only. Put score and shit in there
 
 special block or sprite. more points if hit
 Add levels. Level int add to speed of ball or ++
 
 Set random distance
 
 stop shooting rockets. 
 */

void setup()
{
  size(1366, 700);
  rectMode(CENTER);
  textAlign(RIGHT);


  sprites = new ArrayList<Sprite>();

  game = new Game();
  collision = new Collision();

  paddle = new Paddle((width/2), (height - 50), color(random(255), random(255), random(255)));
  ball = new Ball(250, 400, color(random(255), random(255), random(255)));
  sprites.add(paddle);
  sprites.add(ball);
  sprites.add(game);
}

ArrayList<Block> blocks;
ArrayList<Rocket> rockets;
ArrayList<ScorePower> scores;
ArrayList<AmmoPower> ammos;
ArrayList<Sprite> sprites;
Paddle paddle;
Ball ball;
Game game;
Collision collision;

void draw() {
  background(0);

  game.drawSprites();
  collision.check();
  game.randomPower();
  game.blockGen();
  

  fill(255);
  text("Score: " + game.score +  "\n" + 
    "rocket ammo: " + paddle.ammo  + "\n" + 
    "blocks: " + game.noBlocks() + "\n" + 
    "Score powerups: " + game.noScorePowers() + "\n" + 
    "Ammo powerups: " + game.noAmmoPowers() +  "\n" + 
    game.wait + "\n" +
    "x: " + ball.xspeed +
    "\ny: " + ball.yspeed + 
    "\n tempX: " + ball.tempSpeedX + 
    "\n tempY: " + ball.tempSpeedY +
    "\n Level: " + game.level, game.border, 50);

  //put this in game class

  stroke(255);
  fill(255);
  line(game.border, 0, game.border, height);
}//end draw