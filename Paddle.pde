class Paddle extends Sprite
{
  float paddleWidth = 60;
  float paddleHeight = 10;
  //these can be in abstract class
  float halfPWidth;
  float halfPHieght;
  
  Paddle(float x, float y, color colour)
  {
    this.pos = new PVector(x, y);
    this.colour = colour;
    this.halfPWidth = paddleWidth / 2;
    this.halfPHieght = paddleHeight / 2;
    
    this.left = pos.x - paddleWidth;
    this.right = pos.x + paddleWidth;
    this.top = pos.y - paddleHeight;
    this.bottom = pos.y + paddleHeight;
  }
 
  void render(){
    
    stroke(255);
    fill(colour);
    rect(pos.x, pos.y, paddleWidth, paddleHeight);
  }
  
  void update(){
    if(pos.x >= width - paddleWidth)
    {
      pos.x = width - paddleWidth;
    }
    else if(pos.x <= paddleWidth){
    pos.x = paddleWidth;
    }
    
    pos.x = mouseX;
  }
}