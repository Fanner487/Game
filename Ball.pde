class Ball extends Sprite implements Power
{
  AudioPlayer border;
  int change;
  
  Ball(float x, float y, color colour)
  {
    super(x, y, colour);
    w = 15;
    h = w;
    halfWidth = w * 0.5f;
    halfHeight = halfWidth;
    
    xspeed = 3;
    yspeed = 3;
    
    border = minim.loadFile("border.mp3");
    change = 0;
  }
  
  
  void speedUp()
  {
    //makes sure xspeed and yspeed are positive, then increment speed
    if(xspeed < 0)
    {
      xspeed = -(xspeed);
      ballSpeedIncrement();
    }
    else if(yspeed < 0)
    {
      yspeed = -(yspeed);
      ballSpeedIncrement();
    }
    else
    {
      ballSpeedIncrement();
    }
  }
  
  void ballSpeedIncrement()
  {
    xspeed += 0.5f;
    yspeed += 0.5f;
  }
  
  //makes ball stationary at start point
  void stopBall()
  {

    ball.pos.x = width /2;
    ball.pos.y = 500;
    
    //makes sure ball pointing upwards
    if(yspeed < 0)
    {
      yspeed = -(yspeed);
      
    }
  }
  
  void render()
  {
    stroke(255);
    fill(this.colour);
    ellipse(pos.x, pos.y, w, h);
  }
  
  //put in interface
  void borderSound()
  {
    border.rewind();
    border.play();
  }
  
  void update()
  {
    
    pos.x -= xspeed;
    pos.y -= yspeed;
    
    change = (int)map(pos.y, 0, height, 200, 255);
    colour = color(change, 0, 0);
    
    //abstract method in Sprite class
    pointUpdate();
    
    //border collisions
    if (this.right > width)
    {
      //right
      this.xspeed = -(xspeed);
      borderSound();
    }
    if (this.left < game.border) {
      //left
      this.xspeed = -(xspeed);
      borderSound();
    }
    if (this.top < 0)
    {
      //top
      this.yspeed = -(yspeed);
      borderSound();
    }
    if (this.bottom > height)
    { 
      gameover = true;
    }
  }


  void add1(Sprite sprite)
  {
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite game = sprites.get(i);

      if (game instanceof Game)
      {
        ((Game) game).score++;
      }
    }
  }
   
}