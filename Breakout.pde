void setup()
{
  size(500, 500);
  background(0);
  rectMode(CENTER);
  paddle = new Paddle((width/2), (height / 2), color(random(255), random(255), random(255)));
}

Paddle paddle;

void draw(){
  background(0);
  println(mouseX + ", " + mouseY);
  
  paddle.update();
  paddle.render();
}