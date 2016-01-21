void setup()
{
  size(1366, 700);
  background(0);
  rectMode(CENTER);

  game = new Game();
  paddle = new Paddle((width/2), (height - 50), color(random(255), random(255), random(255)));
  ball = new Ball(250, 250, color(random(255), random(255), random(255)));
  pow = new ScorePower(1300);
  //score = new AmmoPower(1200);


  blocks = new ArrayList<Block>();
  rockets = new ArrayList<Rocket>();
  scores = new ArrayList<ScorePower>();
  ammos = new ArrayList<AmmoPower>();
  //for (int i = 0; i < 7; i++)
  //{
  //  Block b = new Block((int)random(50, 600), 100 + (30 * i), color(random(255), random(255), random(255)));
  //  blocks.add(b);
  //}
  for (int i = 0; i < 1; i++)
  {
    Block b = new Block(250, 100 + (30 * i), color(random(255), random(255), random(255)));
    AmmoPower a = new AmmoPower(1200);
    blocks.add(b);
    ammos.add(a);
  }

  scores.add(pow);
}

ArrayList<Block> blocks;
ArrayList<Rocket> rockets;
ArrayList<ScorePower> scores;
ArrayList<AmmoPower> ammos;
Paddle paddle;
Ball ball;
ScorePower pow;
Game game;



void draw() {
  background(0);

  game.drawSprites();
  game.checkCollisions();

  for (int i = 0; i < scores.size(); i++)
  {
    ScorePower score = scores.get(i);
    fill(score.colour);
    score.render();
    score.update();
    score.paddleCollision();
  }

  for (int i = 0; i < ammos.size(); i++)
  {
    AmmoPower ammo = ammos.get(i);
    fill(ammo.colour);
    ammo.render();
    ammo.update();
    ammo.paddleCollision();
  }

  //fill(score.colour);
  //score.render();
  //score.update();
  println("rockets size: " + rockets.size() + 
          " Ammo: " + paddle.ammo);
  fill(255);
  text("Score: " + game.score +  "\n" + 
       "rocket ammo: " + paddle.ammo  + "\n" + 
       "blocks: " + blocks.size() + "\n" + 
       "Score powerups: " + scores.size() + "\n" + 
       "Ammo powerups: " + ammos.size(), 1200, 50);
}//end draw