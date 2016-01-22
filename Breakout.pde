void setup()
{
  size(1366, 700);
  background(0);
  rectMode(CENTER);
  sprites = new ArrayList<Sprite>();
  game = new Game();
  paddle = new Paddle((width/2), (height - 50), color(random(255), random(255), random(255)));
  ball = new Ball(250, 400, color(random(255), random(255), random(255)));
  pow = new ScorePower(1300);
  //score = new AmmoPower(1200);


  blocks = new ArrayList<Block>();
  rockets = new ArrayList<Rocket>();
  scores = new ArrayList<ScorePower>();
  ammos = new ArrayList<AmmoPower>();

  for (int i = 0; i < 7; i++)
  {
    Block b = new Block((int)random(50, 600), 100 + (30 * i), color(random(255), random(255), random(255)));
    sprites.add(b);
  }
  
  for (int i = 0; i < 3; i++)
  {
    AmmoPower a = new AmmoPower((int)random(0, 1366));
    sprites.add(a);
  }


  //for (int i = 0; i < 7; i++)
  //{
  //  Block b = new Block(250, 100 + (30 * i), color(random(255), random(255), random(255)));
  //  //AmmoPower a = new AmmoPower(1200);
  //  blocks.add(b);
  //  //ammos.add(a);
  //}

  //scores.add(pow);
}

ArrayList<Block> blocks;
ArrayList<Rocket> rockets;
ArrayList<ScorePower> scores;
ArrayList<AmmoPower> ammos;
ArrayList<Sprite> sprites;
Paddle paddle;
Ball ball;
ScorePower pow;
Game game;



void draw() {
  background(0);

  game.drawSprites();
  game.checkCollisions();

  fill(255);
  text("Score: " + game.score +  "\n" + 
    "rocket ammo: " + paddle.ammo  + "\n" + 
    "blocks: " + blocks.size() + "\n" + 
    "Score powerups: " + scores.size() + "\n" + 
    "Ammo powerups: " + ammos.size(), 1200, 50);
}//end draw