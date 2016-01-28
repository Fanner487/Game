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
 
 Do some casting. Change interface
 
 Set random distance
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
boolean allGone = false;
int wait = 0;


void draw() {
  background(0);
  if (allGone == true && wait<200) {
    
   
    wait++;
    if (wait==200) {
      wait =0;
      game.blockGen();
      allGone = false;
      
    }
  }
  //put in game class
  if (game.noBlocks() == 0)
  {
    allGone = true;
    
    
    
  } 
  
  

  game.drawSprites();
  collision.check();
  game.randomPower();

  fill(255);
  text("Score: " + game.score +  "\n" + 
    "rocket ammo: " + paddle.ammo  + "\n" + 
    "blocks: " + game.noBlocks() + "\n" + 
    "Score powerups: " + game.noScorePowers() + "\n" + 
    "Ammo powerups: " + game.noAmmoPowers() +  "\n" + wait, game.border, 50);

  //put this in game class

  stroke(255);
  fill(255);
  line(game.border, 0, game.border, height);
}//end draw