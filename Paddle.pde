//paddle class
class Paddle extends Sprite implements Sound
{
  AudioPlayer shoot;
  int ammo;
  int change;

  Paddle(float x, float y, color colour)
  {  
    super(x, y, colour);
    w = 100;
    h = 10;
    halfWidth = w * 0.5f;
    halfHeight = h * 0.5f;

    ammo = 100;
    shoot = minim.loadFile("shootRocket.mp3");
  }
  
  void pausePaddle(float x)
  {
    ball.pos.x = x;
    
  }
  
  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(255);
    fill(colour);
    rotate(theta);
    rect(0, 0, w, h);
    popMatrix();
  }

  int elapsed = 60;

  void play(AudioPlayer sound)
  {
    sound.rewind();
    sound.play();
  }

  void update() {
    pos.x = mouseX;
    
    //changes the brightness of paddle colour depending on x position
    //gets darker as it moves towards borders
    if (pos.x < game.halfGameSpace)
    {
      change = (int)map(pos.x, game.border, game.halfGameSpace, 80, 255);
      colour = color(change, 50, change);
    }
    else{
      //temp maps pos.x past halfgameSpace length to inverse on left side of it
      int temp = (int)map(pos.x, width, game.halfGameSpace, game.border, game.halfGameSpace );
      change = (int)map(temp, game.border, game.halfGameSpace, 80, 255);
      colour = color(change, 50, change);
    }
    
    pointUpdate();
    
    //maybe change this
    if (right >= width)
    {
      pos.x = width - halfWidth;
    } else if (this.left <= game.border) {
      pos.x = game.border + halfWidth;
    }


    //creates rockets when right mouse button clicked and only every hald second
    if (mousePressed && (mouseButton == RIGHT) && elapsed > 30 && ammo > 0 && !game.noBlocksLeft()) {
      Rocket rocket = new Rocket(pos.x, pos.y, colour);
      sprites.add(rocket);
      play(shoot);
      ammo--;

      elapsed = 0;
    }

    elapsed++;
  }
}