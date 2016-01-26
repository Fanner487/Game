/*
IDEAS: explosion with the rockets. Have a new class for that
 Power ups can be random. E.g. 2 bullets or 10 score power
 Maybe change collisions? Paddle collisions. Don't let ball bounce from bottom
 Merging blocks that make more. Make blocks bounce off each other too
 Create the borders. Info displaying on left/right/both
 Background changes during moments?
 Ball speed ups.
 Stick border to one side
 
 Put border on left only. Put score and shit in there
 
 special block or spritemore points if hit
 Add levels. Level int add to speed of ball or ++
 */

void setup()
{
  size(1366, 700);
  rectMode(CENTER);

  sprites = new ArrayList<Sprite>();

  game = new Game();
  collision = new Collision();

  paddle = new Paddle((width/2), (height - 50), color(random(255), random(255), random(255)));
  ball = new Ball(250, 400, color(random(255), random(255), random(255)));
  sprites.add(paddle);
  sprites.add(ball);

  for (int i = 0; i < 7; i++)
  {
    Block b = new Block((int)random(game.border + 20, 1000), 100 + (50 * i), color(random(255), random(255), random(255)));
    sprites.add(b);
  }
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

  fill(255);
  text("Score: " + game.score +  "\n" + 
    "rocket ammo: " + paddle.ammo  + "\n" + 
    "blocks: " + game.noBlocks() + "\n" + 
    "Score powerups: " + game.noScorePowers() + "\n" + 
    "Ammo powerups: " + game.noAmmoPowers(), 1200, 50);
  line(game.border, 0, game.border, height);
}//end draw

//testing stuff