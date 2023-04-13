
tree tree1;
tree tree2;
tree tree3;
tree tree4;
tree tree5;

void setup()
{
  fullScreen();
  background(0);
  generateTrees();
  frameRate(0.5);
  colorMode(HSB);
}

void draw()
{
  background(200);
  tree1.display(width * 0.1, height);
  tree2.display(width * 0.3, height);
  tree3.display(width * 0.5, height);
  tree4.display(width * 0.7, height);
  tree5.display(width * 0.9, height);
  generateTrees();
}

void generateTrees()
{
  tree1 = new tree();
  tree2 = new tree();
  tree3 = new tree();
  tree4 = new tree();
  tree5 = new tree();
}
