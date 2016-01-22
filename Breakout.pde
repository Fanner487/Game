/*
IDEAS: explosion with the rockets. Have a new class for that
        Power ups can be random. E.g. 2 bullets or 10 score power
        Maybe change collisions?
        Merging blocks that make more. Make blocks bounce off each other too
        Create the borders. Info displaying on left/right/both
*/



void setup()
{
  size(1366, 700);
  background(0);
  rectMode(CENTER);
  sprites = new ArrayList<Sprite>();
  game = new Game();
  paddle = new Paddle((width/2), (height - 50), color(random(255), random(255), random(255)));
  ball = new Ball(250, 400, color(random(255), random(255), random(255)));
  sprites.add(paddle);
  sprites.add(ball);

  for (int i = 0; i < 7; i++)
  {
    Block b = new Block((int)random(50, 600), 100 + (30 * i), color(random(255), random(255), random(255)));
    sprites.add(b);
  }
  
  for (int i = 0; i < 3; i++)
  {
    AmmoPower a = new AmmoPower((int)random(0, 1366));
    sprites.add(a);
    ScorePower b = new ScorePower((int)random(0, 1366));
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



void draw() {
  background(0);

  game.drawSprites();
  game.checkCollisions();

  fill(255);
  text("Score: " + game.score +  "\n" + 
    "rocket ammo: " + paddle.ammo  + "\n" + 
    "blocks: " + noBlocks() + "\n" + 
    "Score powerups: " + noScorePowers() + "\n" + 
    "Ammo powerups: " + noAmmoPowers(), 1200, 50);
    
}//end draw

//testing stuff
int noBlocks()
{
  int n = 0;
  for(int i = 0; i < sprites.size(); i++)
  {
    Sprite b = sprites.get(i);
    
    if(b instanceof Block)
    {
      n++;
    }
  }
  
  return n;
}

int noScorePowers()
{
  int n = 0;
  for(int i = 0; i < sprites.size(); i++)
  {
    Sprite b = sprites.get(i);
    
    if(b instanceof ScorePower)
    {
      n++;
    }
  }
  
  return n;
}

int noAmmoPowers()
{
  int n = 0;
  for(int i = 0; i < sprites.size(); i++)
  {
    Sprite b = sprites.get(i);
    
    if(b instanceof AmmoPower)
    {
      n++;
    }
  }
  
  return n;
}