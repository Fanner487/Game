class Block extends Sprite implements Power
{
  float blockWidth;
  float blockHeight;
  float halfBlockWidth;
  float halfBlockHeight;
  boolean hit;
  boolean set = false;
  int x = 0;

  Block(int x, int y, color colour)
  {
    this.pos = new PVector(x, y);
    this.colour = colour;

    blockWidth = 60;
    blockHeight = 20;
    halfWidth = blockWidth * 0.5f;
    halfHeight = blockHeight * 0.5f;

    speed = 3;
    xspeed = speed;

    //mybe take this out
    hit = false;
  }

  void scoreAdd(Game game)
  {
    game.score += 5;
  }

  void ammoAdd(Paddle paddle) {
  }

  void render() {
    stroke(255);
    fill(this.colour);
    rect(pos.x, pos.y, blockWidth, blockHeight);
  }
  void update() {

    //sets direction for block. May change
    if (set == false)
    {
      //put in function?
      x = (int) random(0, 2);
      this.set = true;
    }

    if (x == 0)
    {
      pos.x += xspeed;
    } else if (x == 1)
    {
      pos.x += -(xspeed);
    }

    left = pos.x - halfWidth;
    right = pos.x + halfWidth;
    top = pos.y - halfHeight;
    bottom = pos.y + halfHeight;

    //change this. move to collisions class
    if (this.right >= width || this.left <= game.border)
    {
      xspeed = -(xspeed);
    }
  }
}