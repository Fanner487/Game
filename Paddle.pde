class Paddle extends Sprite
{
  float paddleWidth;
  float paddleHeight;

  int ammo;
  
  Paddle(float x, float y, color colour)
  {
    this.pos = new PVector(x, y);
    this.colour = colour;
    paddleWidth = 100;
    paddleHeight = 10;
    halfWidth = paddleWidth * 0.5f;
    halfHeight = paddleHeight * 0.5f;
    
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
    left = pos.x - halfWidth;
    right = pos.x + halfWidth;
    top = pos.y - halfHeight;
    bottom = pos.y + halfHeight;
    
    //maybe change this
    if(pos.x + halfWidth >= width )
    {
      pos.x = width - halfWidth;
    }
    else if(pos.x - this.halfWidth <= 0){
      pos.x = halfWidth;
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