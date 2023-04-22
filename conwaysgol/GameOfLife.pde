int board[][];
int rowCount;
int columnCount;

final int scale = 5;
final int born_requirement = 3;
final int survive_requirement = 2;

void setup()
{
  fullScreen();
  rowCount = height/scale;
  columnCount = width/scale;
  board = new int[rowCount][columnCount];
  
  for (int y = 0; y < rowCount; y++)
  {
    for (int x = 0; x < columnCount; x++)
    {
      board[y][x] = (int)(random(0,2));
    }
  }
  noStroke();
}

void draw()
{
  background(0);
  for (int y = 0; y < rowCount; y++)
  {
    for (int x = 0; x < columnCount; x++)
    {
      fill(255 * board[y][x]);
      rect(x * scale, y * scale, scale, scale);
    }
  }
  update();
}

void update()
{
  int tempBoard[][] = new int[rowCount][columnCount];
  int neighbors;
  for (int y = 0; y < rowCount; y++)
  {
    for (int x = 0; x < columnCount; x++)
    {
      tempBoard[y][x] = 0;
      
      neighbors = countNeighbors(y, x);
      
      if (neighbors == born_requirement)
      {
        tempBoard[y][x] = 1;
      }
      else if (neighbors == survive_requirement)
      {
        tempBoard[y][x] = board[y][x];
      }
    }
  }
  
  board = tempBoard;
}

int countNeighbors(int y, int x)
{  
  int neighborCount = 0;
  int range = 1;
  int nX;
  int nY;
  
  for (int deltaY = -range; deltaY <= range; deltaY++)
  {
    for (int deltaX = -range; deltaX <= range; deltaX++)
    {
      if (deltaX == 0 && deltaY == 0)
      {
        continue;
      }
      nY = (y + deltaY + rowCount) % rowCount;
      nX = (x + deltaX + columnCount) % columnCount;

      neighborCount += board[nY][nX];
    }
  }
  return neighborCount;
}
