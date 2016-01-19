void setup()
{
  size(1366, 700);
  background(0);
  rectMode(CENTER);
  
  
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



void draw() {
  background(0);
  
  drawBallPaddle();
  drawBlocks();
  drawRockets();
  checkPaddle();
  rocketCollisions();
  ballCollisions();
  
  for(int i = 0; i < scores.size(); i++)
  {
    ScorePower score = scores.get(i);
    fill(score.colour);
    score.render();
    score.update();
    score.paddleCollision();
  }
  
  for(int i = 0; i < ammos.size(); i++)
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
  println("Size: " + rockets.size() + " Ammo: " + paddle.ammo);
  
  
}//end draw



void checkPaddle() {
  //paddle collision
  if ((ball.pos.x >= paddle.pos.x - paddle.halfPWidth) && (ball.pos.x <= paddle.pos.x + paddle.halfPWidth) && (ball.pos.y + ball.halfB >= paddle.pos.y - paddle.halfPHeight))
  {
    ball.yspeed = -(ball.yspeed);
  }
}

void drawBallPaddle()
{
  fill(paddle.colour);
  paddle.update();
  paddle.render();
  
  fill(ball.colour);
  ball.update();
  ball.render();
}

void drawBlocks()
{
  for (int i = 0; i < blocks.size(); i++)
  {

    Block block = blocks.get(i);
    fill(block.colour);
    block.render();
    block.update();
  }
}

void drawRockets()
{
  for(int i = 0; i < rockets.size(); i++)
  {
    Rocket rocket = rockets.get(i);
    
    rocket.render();
    rocket.update();
  }
}


/*

COMMENTED OUT FUNCTION WORKS. TESTING FUNCTION BELOW THIS ONE

*/

void ballCollisions()
{
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

/*

  THIS ONE IS THE PROBLEM. 
  REFER TO BALL AND BLOCK CLASSES. PROBLEM MIGHT LIE THERE BUT CAN'T FIND IT

*/
//void ballCollisions()
//{
//  for (int i = 0; i < blocks.size(); i++)
//  {
//    Block block = blocks.get(i);
//    //bottom of block
//    if ((ball.pos.x >= block.left) && (ball.pos.x <= block.right) && (ball.top <= block.bottom) && (ball.pos.y > block.pos.y))
//    {
//      ball.yspeed = -(ball.yspeed);

//      blocks.remove(block);
//    }
//    //top side of block
//    if ((ball.pos.x >= block.left) && (ball.pos.x <= block.right) && (ball.bottom >= block.top) && (ball.pos.y < block.pos.y))
//    {
//      ball.yspeed = -(ball.yspeed);  

//      blocks.remove(block);
//    }
//    //left side of block
//    if ((ball.pos.y >= block.top) && (ball.pos.y <= block.bottom) && (ball.right >= block.left) && (ball.pos.x < block.pos.x))
//    {
//      ball.xspeed = -(ball.xspeed);   

//      blocks.remove(block);
//    }
//    //right side
//    if ((ball.pos.y >= block.top) && (ball.pos.y <= block.bottom) && (ball.left <= block.right) && (ball.pos.x > block.pos.x))
//    {
//      ball.xspeed = -(ball.xspeed); 
//      blocks.remove(block);
//    }
//  }
//}

void rocketCollisions()
{
  for(int i = 0; i < rockets.size(); i++)
  {
    Rocket rocket = rockets.get(i);
    
    if(rocket instanceof Rocket)
    {
      for (int j = 0; j < blocks.size(); j++)
      {
        Block block = blocks.get(j);
        if(block instanceof Block)
        {
          if(rocket.pos.x <= block.pos.x + block.halfBlockWidth && rocket.pos.x >= block.pos.x - block.halfBlockWidth && rocket.pos.y <= block.pos.y + block.halfBlockHeight && rocket.pos.y >= block.pos.y - block.halfBlockHeight)
          {
            rockets.remove(rocket);
            blocks.remove(block);
          }        
        }
      }
    }
  }
}