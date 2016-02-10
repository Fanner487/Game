//paddle class
class Paddle extends Sprite implements Sound
{
  AudioPlayer shoot;
  int ammo;
  int change;
  int elapsed;
  int w;
  int h;

  Paddle(float x, float y)
  {  
    super(x, y);
    w = 100;
    h = 10;
    halfWidth = w * 0.5f;
    halfHeight = h * 0.5f;
    
    ammo = 5;
    shoot = minim.loadFile("shootRocket.mp3");
    elapsed = 60;
  }

  void pausePaddle(float x)
  {
    ball.pos.x = x;
  }

  void render() 
  {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(255);
    fill(colour);
    rect(0, 0, w, h);
    popMatrix();
  }



  void update()
  {
    pos.x = mouseX;
    pointUpdate();

    //changes the brightness of paddle colour depending on x position
    //gets darker as it moves towards borders
    if (pos.x < game.halfGameSpace)
    {
      change = (int)map(pos.x, game.border, game.halfGameSpace, 80, 255);
      colour = color(change, 0, change);
    } else {
      //temp maps pos.x past halfgameSpace length to inverse on left side of it
      //
      int temp = (int)map(pos.x, width, game.halfGameSpace, game.border, game.halfGameSpace );
      change = (int)map(temp, game.border, game.halfGameSpace, 80, 255);
      colour = color(change, 0, change);
    }    

    //keeps paddle within borders of field
    if (right >= width)
    {         
      pos.x = width - halfWidth;     
    } else if (left <= game.border) 
    {  
      pos.x = game.border + halfWidth;
    }

    //creates rockets when right mouse button clicked and only every half second
    if (mousePressed && (mouseButton == RIGHT) && elapsed > 30 && ammo > 0 && !game.noBlocksLeft()) {
      
      Rocket rocket = new Rocket(pos.x, pos.y, colour);
      sprites.add(rocket);
      play(shoot);
      ammo--;
      elapsed = 0;
    }

    elapsed++;
  }


  void play(AudioPlayer sound)
  {  
    sound.rewind();
    sound.play();
  }
}