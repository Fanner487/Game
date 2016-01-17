void setup()
{
  size(800, 500);
  background(0);
  rectMode(CENTER);
  paddle = new Paddle((width/2), (height - 50), color(random(255), random(255), random(255)));
  ball = new Ball(250, 250, color(random(255), random(255), random(255)));

  blocks = new ArrayList<Block>();
  for (int i = 0; i < 3; i++)
  {
    Block b = new Block(250, 100 + (30 * i), color(random(255), random(255), random(255)));
    blocks.add(b);
  }
  println(ball.left);
}

ArrayList<Block> blocks;
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

  checkPaddle();


  for (int i = 0; i < blocks.size(); i++)
  {
    Block block = blocks.get(i);
    //bottom
    if ((ball.pos.x >= block.left) && (ball.pos.x <= block.right) && (ball.top <= block.bottom) && (ball.pos.y > block.pos.y))
    {
      ball.yspeed = -(ball.yspeed);

      blocks.remove(block);
    }
    //top side of block
    if ((ball.pos.x) >= (block.pos.x - block.halfBlockWidth) && (ball.pos.x) <= (block.pos.x + block.halfBlockWidth) && (ball.pos.y + ball.halfB) >= (block.pos.y - block.halfBlockHeight) && (ball.pos.y < block.pos.y))
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