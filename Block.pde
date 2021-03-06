class Block extends Sprite implements Power, Sound
{
  int x = 0;

  //can add sound when border hit
  AudioPlayer border;

  Block(int x, int y, color colour, float speed)
  {   
    super(x, y, colour);
    w = 60;
    h = 20;
    halfWidth = w * 0.5f;
    halfHeight = h * 0.5f;
    border = minim.loadFile("border.mp3");

    //sets the direction which the block moves
    x = (int) random(0, 2);
    switch(x)
    {
    case 0:
      this.speed = speed;
      break;
    case 1:
      this.speed = -(speed);
      break;
    }
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(255);
    fill(colour);
    rect(0, 0, w, h);
    popMatrix();
  }

  void update() {

    pos.x += speed;

    pointUpdate();

    //border collisions
    if (this.right >= width || this.left <= game.border)
    {
      speed = -(speed);
      play(border);
    }
  }

  void addTo(Sprite sprite)
  {
    for (int i = 0; i < sprites.size(); i++)
    {
      Sprite game = sprites.get(i);

      if (game instanceof Game)
      {
        ((Game) game).score += 5;
      }
    }
  }

  void play(AudioPlayer sound)
  {
    sound.rewind();
    sound.play();
  }
}