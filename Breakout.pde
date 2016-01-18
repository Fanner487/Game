void setup()
{
  size(1366, 700);
  background(0);
  rectMode(CENTER);
  paddle = new Paddle((width/2), (height - 50), color(random(255), random(255), random(255)));
  ball = new Ball(250, 250, color(random(255), random(255), random(255)));

  blocks = new ArrayList<Block>();
  rockets = new ArrayList<Rocket>();
  for (int i = 0; i < 7; i++)
  {
    Block b = new Block((int)random(50, 600), 100 + (30 * i), color(random(255), random(255), random(255)));
    blocks.add(b);
  }
  println(ball.left);
}

ArrayList<Block> blocks;
ArrayList<Rocket> rockets;
Paddle paddle;
Ball ball;


void draw() {
  background(0);
  
  fill(paddle.colour);
  paddle.update();
  paddle.render();
  
  fill(ball.colour);
  ball.update();
  ball.render();
  //println(blocks.size());

  for (int i = 0; i < blocks.size(); i++)
  {

    Block block = blocks.get(i);
    fill(block.colour);
    block.render();
    block.update();
  }
  
  for(int j = 0; j < rockets.size(); j++)
  {
    Rocket rocket = rockets.get(j);
    fill(rocket.colour);
    rocket.render();
    rocket.update();
  }

  checkPaddle();


  for (int i = 0; i < blocks.size(); i++)
  {
    Block block = blocks.get(i);
    //bottom
    if ((ball.pos.x >= (block.pos.x - block.halfBlockWidth)) && (ball.pos.x <= (block.pos.x + block.halfBlockWidth)) && ((ball.pos.y - ball.halfB) <= (block.pos.y + block.halfBlockHeight)) && (ball.pos.y > block.pos.y))
    {
      ball.yspeed = -(ball.yspeed);

      blocks.remove(block);
    }
    //top side of block
    if ((ball.pos.x >= block.pos.x - block.halfBlockWidth) && (ball.pos.x <= block.pos.x + block.halfBlockWidth) && (ball.pos.y + ball.halfB >= block.pos.y - block.halfBlockHeight) && (ball.pos.y < block.pos.y))
    {
      ball.yspeed = -(ball.yspeed);  

      blocks.remove(block);
    }
    //left side of block
    if ((ball.pos.y) >= (block.pos.y - block.halfBlockHeight) && (ball.pos.y) <= (block.pos.y + block.halfBlockHeight) && (ball.pos.x + ball.halfB) >= (block.pos.x - block.halfBlockWidth) && (ball.pos.x < block.pos.x))
    {
      ball.xspeed = -(ball.xspeed);   

      blocks.remove(block);
    }
    //right side
    if ((ball.pos.y) >= (block.pos.y - block.halfBlockHeight) && (ball.pos.y) <= (block.pos.y + block.halfBlockHeight) && (ball.pos.x - ball.halfB) <= (block.pos.x + block.halfBlockWidth) && (ball.pos.x > block.pos.x))
    {
      ball.xspeed = -(ball.xspeed); 
      blocks.remove(block);
    }
  }
}

void checkCollisions() {
}

void checkPaddle() {
  //paddle collision
  if ((ball.pos.x >= paddle.pos.x - paddle.halfPWidth) && (ball.pos.x <= paddle.pos.x + paddle.halfPWidth) && (ball.pos.y + ball.halfB >= paddle.pos.y - paddle.halfPHeight))
  {
    ball.yspeed = -(ball.yspeed);
  }
}