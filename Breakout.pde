void setup()
{
  size(500, 500);
  background(0);
  rectMode(CENTER);
  paddle = new Paddle((width/2), (height - 50), color(random(255), random(255), random(255)));
  ball = new Ball((width/2) - 50, (height / 2), color(random(255), random(255), random(255)));

  for (int i = 0; i < 4; i++)
  {
    Block block = new Block(10 + (40 * i), 50, color(random(255), random(255), random(255)));
    blocks.add(block);
  }
}

Paddle paddle;
Ball ball;
ArrayList<Block> blocks = new ArrayList<Block>();

void draw() {
  background(0);

  paddle.update();
  paddle.render();

  ball.update();
  ball.render();
  
  blocks.get(2).hit = true;

  for (int i = 0; i < 4; i++)
  {
    Block block = blocks.get(i);
    if (block.hit == false)
    {
      block.update();
      block.render();
    }
  }

  if (ball.pos.x > (paddle.pos.x - paddle.halfPWidth) && ball.pos.x < (paddle.pos.x + paddle.halfPWidth) && (ball.pos.y + ball.halfB) > (paddle.pos.y - paddle.halfPHieght))
  {
    ball.yspeed = -(ball.yspeed);
  }
}