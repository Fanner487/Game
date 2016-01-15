class Paddle extends Sprite
{
  float paddleWidth = 40;
  float paddleHeight = 10;
  float halfPWidth = paddleWidth / 2;
  float halfPHieght = paddleHeight / 2;
  
  Paddle(float x, float y, color colour)
  {
    pos = new PVector(x, y);
    this.colour = colour;
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