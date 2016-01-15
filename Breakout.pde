void setup()
{
  size(500, 500);
  background(0);
  rectMode(CENTER);
  paddle = new Paddle((width/2), (height - 50), color(random(255), random(255), random(255)));
  ball = new Ball((width/2) - 50, (height / 2), color(random(255), random(255), random(255)));
}

Paddle paddle;
Ball ball;

void draw(){
  background(0);
  println(mouseX + ", " + mouseY);
  
  paddle.update();
  paddle.render();
  
  ball.update();
  ball.render();
  
  if(ball.pos.x > (paddle.pos.x - paddle.halfPWidth) && ball.pos.x < (paddle.pos.x + paddle.halfPWidth) && (ball.pos.y + ball.halfB) > (paddle.pos.y - paddle.halfPHieght))
  {
    ball.yspeed = -(ball.yspeed);
  }
}