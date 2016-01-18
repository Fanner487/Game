class Paddle extends Sprite
{
  float paddleWidth;
  float paddleHeight;
  //these can be in abstract class
  float halfPWidth;
  float halfPHeight;
  int ammo;
  
  Paddle(float x, float y, color colour)
  {
    this.pos = new PVector(x, y);
    this.colour = colour;
    paddleWidth = 100;
    paddleHeight = 10;
    halfPWidth = paddleWidth * 0.5f;
    halfPHeight = paddleHeight * 0.5f;
    
    this.left = pos.x - halfPWidth;
    this.right = pos.x + halfPWidth;
    this.top = pos.y - halfPHeight;
    this.bottom = pos.y + halfPHeight;
    
    ammo = 50;
  }
 
  void render(){
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(255);
    fill(colour);
    rotate(theta);
    rect(0, 0, paddleWidth, paddleHeight);
    popMatrix();
  }
  
  int elapsed = 60;
  
  
  void update(){
    
    //maybe change this
    if(pos.x + halfPWidth >= width )
    {
      pos.x = width - halfPWidth;
    }
    else if(pos.x - this.halfPWidth <= 0){
      pos.x = paddleWidth;
    }
    
    pos.x = mouseX;
    
    if (mousePressed && (mouseButton == LEFT) && elapsed > 60 && ammo > 0) {
      Rocket rocket = new Rocket();
      rocket.pos.x = this.pos.x;
      rocket.pos.y = this.pos.y;
      rocket.colour = colour;
      rockets.add(rocket);
      ammo--;
      
      println("r");
      elapsed = 0;
      
    }
    
    elapsed++;
  }
}