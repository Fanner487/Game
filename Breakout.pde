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
    Block b = new Block((int)random(game.border, 1000), 100 + (30 * i), color(random(255), random(255), random(255)));
    sprites.add(b);
  }
  
  for (int i = 0; i < 3; i++)
  {
    AmmoPower a = new AmmoPower((int)random(game.border, 1300));
    sprites.add(a);
    ScorePower b = new ScorePower((int)random(game.border, 1300));
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

  fill(255);
  text("Score: " + game.score +  "\n" + 
    "rocket ammo: " + paddle.ammo  + "\n" + 
    "blocks: " + game.noBlocks() + "\n" + 
    "Score powerups: " + game.noScorePowers() + "\n" + 
    "Ammo powerups: " + game.noAmmoPowers(), 1200, 50);
    line(game.leftBorder, 0, game.leftBorder, height);
    line(game.rightBorder, 0, game.rightBorder, height);
    
}//end draw

//testing stuff