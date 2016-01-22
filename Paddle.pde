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
    
    
    
    ammo = 10;
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
    pos.x = mouseX;
    left = pos.x - halfPWidth;
    right = pos.x + halfPWidth;
    top = pos.y - halfPHeight;
    bottom = pos.y + halfPHeight;
    
    //maybe change this
    if(pos.x + halfPWidth >= width )
    {
      pos.x = width - halfPWidth;
    }
    else if(pos.x - this.halfPWidth <= 0){
      pos.x = paddleWidth;
    }
    
    
    //problem is here
    if (mousePressed && (mouseButton == LEFT) && elapsed > 30 && ammo > 0) {
      Rocket rocket = new Rocket(this.pos.x, this.pos.y, this.colour);
      //null pointer exception runs on point following line
      
      rocket.pos.x = pos.x;
      rocket.pos.y = pos.y;
      rocket.colour = colour;
      
      sprites.add(rocket);
      ammo--;
      
      println("r");
      elapsed = 0;
      
    }
    
    elapsed++;
  }
}