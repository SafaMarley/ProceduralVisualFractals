snowflake s1;

void setup()
{
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  s1 = new snowflake();
  frameRate(1);
}

void draw()
{
  background(0);
  pushMatrix();
    translate(width * 0.5, height * 0.5);
    s1.display();
    s1.reset();
  popMatrix();
}
