class tree
{
  float branchLength;
  float branchAngle;
  float branchLengthReductionRate;
  float branchColor;
  float branchColorReduction;
  int middleBranchProbability;
  int fruitProbability;
  float leafColor;
  float fruitColor;
  
  tree()
  {
    branchLength = random(80, 120);
    branchAngle = random(0.25, 0.45);
    branchLengthReductionRate = random(0.75, 0.8);
    branchColor = random(0, 60);
    branchColorReduction = random(7, 15);
    middleBranchProbability = (int) random(0, 10);
    fruitProbability = (int) random(25, 75);
    leafColor = branchColor * random(1, 2);
    fruitColor = (leafColor + 180) % 360;
  }
  
  tree(float bLength, float bAngle, float bReductionRate, float bColor, float bColorReduction, int fProbability)
  {
    branchLength = bLength;
    branchAngle = bAngle;
    branchLengthReductionRate = bReductionRate;
    branchColor = bColor;
    branchColorReduction = bColorReduction;
    fruitProbability = fProbability;
  }
  
  void fruit(float fruitRadius)
  {
    strokeWeight(1);
    fill(fruitColor, 255, 255);
    circle(0.5 * fruitRadius, 0, fruitRadius);
  }
  
  void leaf(float leafRadius)
  {
    strokeWeight(1);
    fill(leafColor, 255, 255);
    ellipse(0.5 * leafRadius, 0, leafRadius, leafRadius * random(0.35, 0.65));
    line(0, 0, 0.5 * leafRadius, 0);
  }
  
  void branches(float reducedLength, int minLength, int maxDepth, int depth)
  {
    if(reducedLength < minLength || depth > maxDepth)
    {
      if(random(0, 100) < fruitProbability)
      {
        fruit(reducedLength * random(1, 2));
      }
      else
      {
        leaf(reducedLength * random(2, 3));
      }
      return;
    }
    
    pushMatrix();
      rotate(branchAngle * random(0.8, 1.2));
      strokeWeight(reducedLength * random(0.2, 0.3));
      stroke(branchColor, 255 - (branchColorReduction * depth), 100);
      line(0, 0, reducedLength, 0);
      translate(reducedLength, 0);
      branches(reducedLength * branchLengthReductionRate * random(0.85, 1.15), minLength, maxDepth, depth + 1);
     popMatrix();
     
     pushMatrix();
      rotate(-branchAngle * random(0.8, 1.2));
      strokeWeight(reducedLength * random(0.2, 0.3));
      stroke(branchColor, 255 - (branchColorReduction * depth), 100);
      line(0, 0, reducedLength, 0);
      translate(reducedLength, 0);
      branches(reducedLength * branchLengthReductionRate * random(0.85, 1.15), minLength, maxDepth, depth + 1);
     popMatrix();
     
     if(random(0, 100) < middleBranchProbability)
     {
       pushMatrix();
        rotate(0);
        strokeWeight(reducedLength * random(0.2, 0.3));
        stroke(branchColor, 255 - (branchColorReduction * depth), 100);
        line(0, 0, reducedLength, 0);
        translate(reducedLength, 0);
        branches(reducedLength * branchLengthReductionRate * random(0.85, 1.15), minLength, maxDepth, depth + 1);
       popMatrix();
     }
  }
  
  void trunk()
  {
    strokeWeight(branchLength * 0.25);
    stroke(branchColor, 255, 100);
    line(0, 0, branchLength, 0);
    pushMatrix();
      translate(branchLength, 0);
      branches(branchLength * branchLengthReductionRate, (int)random(4, 8), (int)random(8, 12) , 0);
     popMatrix();
  }
  
  void display(float positionX, float positionY)
  {
    pushMatrix();
      translate(positionX, positionY);
      rotate(-0.5 * PI);
      trunk();
    popMatrix();
  }
}
