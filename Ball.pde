class Ball extends Sprite implements Power, Sound
{
  AudioPlayer border;
  int change;
  
  Ball(float x, float y)
  {
    super(x, y);
    w = 15;
    h = w;
    halfWidth = w * 0.5f;
    halfHeight = halfWidth;
    
    xspeed = 3.5f;
    yspeed = 3.5f;
    
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
    ball.pos.y = 600;
    
    //makes sure ball pointing upwards
    if(yspeed < 0)
    {
      yspeed = -(yspeed);   
    }
  }
  
  void render()
  {
    stroke(255);
    fill(colour);
    ellipse(pos.x, pos.y, w, h);
  }
  
  void update()
  {
    
    pos.x -= xspeed;
    pos.y -= yspeed;
    
    //maps brightness of ball relative to pos.y
    change = (int)map(pos.y, 0, height, 0, 128);
    colour = color(255, change, 0);
    
    //abstract method in Sprite class
    pointUpdate();
    
    //border collisions
    if (this.right > width)
    {
      //right
      this.xspeed = -(xspeed);
      this.play(border);
    }
    if (this.left < game.border) {
      //left
      this.xspeed = -(xspeed);
      this.play(border);
    }
    if (this.top < 0)
    {
      //top
      this.yspeed = -(yspeed);
      this.play(border);
    }
    if (this.bottom > height)
    { 
      gameover = true;
    }
  }

  void play(AudioPlayer sound)
  {
    sound.rewind();
    sound.play();
  }

  void addTo(Sprite sprite)
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