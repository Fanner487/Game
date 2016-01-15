class Paddle extends Sprite
{
  int paddleWidth = 40;
  int paddleHeight = 10;
  
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
    pos.x = mouseX;
  }
}