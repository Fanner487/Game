//interface that plays sounds in classes that don't all inherit from Sprite class
//Implemented in Ball, Block, Collision, Game, Menu, Paddle classes
interface Sound
{
  void play(AudioPlayer sound);
}