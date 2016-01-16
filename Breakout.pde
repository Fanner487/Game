void setup()
{
  size(500, 500);
  background(0);
  rectMode(CENTER);
  paddle = new Paddle((width/2), (height - 50), color(random(255), random(255), random(255)));
  ball = new Ball((width/2) - 50, (height / 2), color(random(255), random(255), random(255)));

  for (int i = 0; i < 5; i++)
  {
    ArrayList<Block> row = new ArrayList<Block>();
    for (int j = 0; j < 4; j++)
    {
      Block block = new Block(50 + (100 * i), 50 + (40 * j), color(random(255), random(255), random(255)));
      row.add(block);
    }
    blocks.add(row);
  }
}

Paddle paddle;
Ball ball;
ArrayList<ArrayList<Block>> blocks = new ArrayList<ArrayList<Block>>();

void draw() {
  background(0);

  paddle.update();
  paddle.render();

  ball.update();
  ball.render();

  for (int i = 0; i < 5; i++)
  {
    for(int j = 0; j < 4; j++)
    {
      Block block = blocks.get(i).get(j);
      if(block.hit == false)
      {
        block.render();
        block.update();   
      }
      
    }
    
  }

  if (ball.pos.x > (paddle.pos.x - paddle.halfPWidth) && ball.pos.x < (paddle.pos.x + paddle.halfPWidth) && (ball.pos.y + ball.halfB) > (paddle.pos.y - paddle.halfPHieght))
  {
    ball.yspeed = -(ball.yspeed);
  }
  
  for(int i = 0; i < 5; i++)
  {
    for(int j = 0; j < 4; j++)
    {
     Block block = blocks.get(i).get(j);
     //bottom side of block
     if((ball.right) >= (block.left) && (ball.left) <= (block.right) && (ball.top) <= (block.pos.y + block.halfBlockHeight))
     {
       ball.yspeed = -(ball.yspeed);
     }
    }
  }
  
}

void checkCollisions(){
  
}