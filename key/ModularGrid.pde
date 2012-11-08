class ModularGrid
{
  int cols; 
  int rows;
  float gutterSize;
  float pageMargin;
  Module[][] modules; // Module nested arrays called modules
  float moduleWidth;
  float moduleHeight;

  ModularGrid(int _cols, int _rows, float _gutterSize, float _pageMargin)
  {
    cols = _cols;
    rows = _rows;
    gutterSize = _gutterSize;
    pageMargin = _pageMargin;

    modules = new Module[cols][rows]; //modules nested array equals one array for the columns and one array for the rows

    // cache the width of each column. Remember to cast as float, otherwise the columns will not line up
    // First we find the width of the page without the pagemargin
    float actualPageWidth = ((float)canvas.width - (2*pageMargin));
    // then we find the gutter sizes. We subtract by 1 as the furthermost right module will not have a right-side gutter
    float totalGutterWidth = (cols-1) * gutterSize;
    // then we simply find the column size by subtracting the gutterwidth from the page size and dividing by number of cols
    moduleWidth = (actualPageWidth - totalGutterWidth) / (float)cols;

    // cache the height of each column. This is the exact same calculation as before, and we should probably put
    float actualPageHeight = ((float)canvas.height - (2*pageMargin));
    float totalGutterHeight = (rows-1) * gutterSize;
    moduleHeight = (actualPageHeight - totalGutterHeight) / (float)rows;

    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)// ... for every module location...
      {
        modules[i][j] = new Module(); //create a module
        modules[i][j].x = pageMargin + (i*moduleWidth) + (i*gutterSize); // the module's x coordinate within the nested array of modules is the module width times the previous modules plus the gutter size times previous gutters
        modules[i][j].y = pageMargin + (j*moduleHeight) + (j*gutterSize); // // the module's y coordinate within the nested array of modules is the module height times the previous modules plus the gutter size times previous gutters
        modules[i][j].w = moduleWidth; 
        modules[i][j].h = moduleHeight;
      }
    }
  }

  void display()
  {
    noFill();
    // draw the big bounding box
    canvas.rect(pageMargin, pageMargin, canvas.width - (2*pageMargin), canvas.height - (2*pageMargin));

    // draw all modules
    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        canvas.strokeWeight(1);
        canvas.stroke(0, 100, 100); 
        //draw the grid
        canvas.rect(modules[i][j].x, modules[i][j].y, modules[i][j].w, modules[i][j].h);
      }
    }
  }
}

