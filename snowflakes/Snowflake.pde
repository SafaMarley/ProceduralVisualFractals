class snowflake
{
  float angle;
  float scale;
  int diagonals;
  float middleBranchPossibility;
  float flakeColor;
  int maxDepth;
  float startWidth;
  float widthReductionRate;
  
  snowflake()
  {
    reset();
  }
  
  void reset()
  {
    angle = random(0.25, 0.5);
    scale = random(0.35, 0.55);
    diagonals = (int) random(5, 9);
    middleBranchPossibility = random(0, 100);
    flakeColor = random(150, 250);
    maxDepth = (int) random(3, 8);
    startWidth = random(0.005, 0.015);
    widthReductionRate = random(0.05, 0.15);
  }
  
  void display()
  {
    stroke(flakeColor, 100, 100);
    for(int i = 0; i < diagonals; i++)
    {
      pushMatrix();
        strokeWeight(width * startWidth);
        rotate(i * (2 * PI) / diagonals);
        line(0, 0, width * widthReductionRate, 0);
        translate(width * widthReductionRate, 0);
        branch(width * widthReductionRate * scale, 0);
      popMatrix();
    }
  }
  void branch(float blength, float bdepth)
  {
    if(bdepth > maxDepth)
    {
      return;
    }
    pushMatrix();
      strokeWeight(blength * 0.1);
      rotate(angle * PI);
      line(0, 0, blength, 0);
      translate(blength, 0);
      branch(blength * scale, bdepth + 1);
    popMatrix();
    pushMatrix();
      strokeWeight(blength * 0.1);
      rotate(-angle * PI);
      line(0, 0, blength, 0);
      translate(blength, 0);
      branch(blength * scale, bdepth + 1);
    popMatrix();
    pushMatrix();
      strokeWeight(blength * 0.1);
      rotate(0);
      line(0, 0, blength, 0);
      translate(blength, 0);
      branch(blength * scale, bdepth + 1);
    popMatrix();
  }
};
