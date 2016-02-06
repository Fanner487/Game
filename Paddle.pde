class Paddle extends Sprite
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

    ammo = 10;
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

  void shootSound()
  {
    shoot.rewind();
    shoot.play();
  }
  void update() {
    pos.x = mouseX;
    
    if (pos.x < game.halfGameSpace)
    {
      change = (int)map(pos.x, game.border, game.halfGameSpace, 80, 255);
      colour = color(change, 0, change);
    }
    else{
      int temp = (int)map(pos.x, width, game.halfGameSpace, game.border, game.halfGameSpace );
      change = (int)map(temp, game.border, game.halfGameSpace, 80, 255);
      colour = color(change, 0, change);
    }
    
    //can put this in abstract
    left = pos.x - halfWidth;
    right = pos.x + halfWidth;
    top = pos.y - halfHeight;
    bottom = pos.y + halfHeight;

    //maybe change this
    if (this.right >= width)
    {
      pos.x = width - halfWidth;
    } else if (this.left <= game.border) {
      pos.x = game.border + halfWidth;
    }


    //problem is here
    if (mousePressed && (mouseButton == RIGHT) && elapsed > 30 && ammo > 0 && game.noBlocks() != 0) {
      Rocket rocket = new Rocket(this.pos.x, this.pos.y, this.colour);
      rocket.pos.x = pos.x;
      rocket.pos.y = pos.y;
      rocket.colour = colour;
      sprites.add(rocket);
      shootSound();
      ammo--;

      elapsed = 0;
    }

    elapsed++;
  }
}