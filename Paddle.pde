class Paddle extends Sprite
{
  float paddleWidth;
  float paddleHeight;
  //these can be in abstract class
  float halfPWidth;
  float halfPHeight;
  
  Paddle(float x, float y, color colour)
  {
    this.pos = new PVector(x, y);
    this.colour = colour;
    paddleWidth = 60;
    paddleHeight = 10;
    halfPWidth = paddleWidth * 0.5f;
    halfPHeight = paddleHeight * 0.5f;
    
    this.left = pos.x - halfPWidth;
    this.right = pos.x + halfPWidth;
    this.top = pos.y - halfPHeight;
    this.bottom = pos.y + halfPHeight;
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