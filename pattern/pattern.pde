PGraphics canvas;

/*____________________GLOBAL VARIABLES_______________________________________________________________*/

float scaling =1; //ADJUST THIS TO CHANGE PRESENT SIZE
int canvas_width = 4800;
int canvas_height = 4800;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

int row =20;
int col =20;

float Y1 = 135;
float X1 = 50;
float Y2 = 185;

PFont font;

/*______these variables are current module location________*/
int passX =0;
int passY =0;

void setup()
{ 
  /*____________________SETUP_________________________________________________________________________*/

  size(800, 800, P2D);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 20);
  canvas = createGraphics(canvas_width, canvas_height, P2D);
  calculateResizeRatio();
  //initialize grid(s)
  ModularGrid moduleGrid = new ModularGrid(row, col, 0, 0, 1); //number of columns, rows, gutter size, page margin

  /*____________________DRAW THE PRESENTS______________________________________________________________*/

  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100, 100);
  canvas.background(210, 30, 100);
  canvas.smooth();
  // moduleGrid.display();
  for ( int i=1; i<row; i++) {
    for (int j=1; j<col; j++) {
      passX = (int) moduleGrid.modules[i][j].x;
      passY = (int) moduleGrid.modules[i][j].y;
      int printwidth = (int)moduleGrid.modules[i][j].w-100;
      println(printwidth);
      drawShape(canvas.width / 2, canvas.height / 2, (int)moduleGrid.modules[i][j].w-(50), Y1, X1, Y2);

      //LOGO
      float white = random(90, 100);
      color logo = color(0, 0, white);
      canvas.fill(logo);
      canvas.textAlign(CENTER, BOTTOM);
      canvas.textSize(100*scaling);
      font = loadFont("Tandelle-140.vlw");
      canvas.textFont(font, 140*scaling);
      canvas.text('m', passX, passY-(3*scaling));
      canvas.noFill();
      canvas.stroke(logo);
      canvas.strokeWeight(10*scaling);
      canvas.ellipseMode(CENTER);
      canvas.ellipse(passX, passY-(60*scaling), 105*scaling, 105*scaling);
    }
  }
  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);
  canvas.save("sketch.tif");
}

/*____________________CREATE THE SHAPES_________________________________________________________________________*/

void drawShape(int x, int y, int siz, float y1, float x1, float y2)
{
  canvas.pushMatrix();

  /*____________boxes____________*/

  canvas.noFill();
  canvas.rectMode(CENTER);
  canvas.smooth();
  //  canvas.fill(random(180, 250), random(100), random(100));
  //  canvas.noStroke();
  canvas.strokeWeight(19);
  canvas.stroke(random(180, 250), random(0, 90), random(100));
  //canvas.rect(passX, passY, (siz*scaling)+(40*scaling), (siz*scaling));
  for (int i=0;i<14;i++) {
    canvas.line(passX-((siz/2)*scaling), passY-((10*i)*scaling), passX+((siz/2))*scaling, passY-((10*i)*scaling));
  }

  /*____________bows____________*/

  canvas.noStroke();
  canvas.fill(random(0, 360), 60, 95);
  canvas.triangle(passX, passY-(y1*scaling), passX-(x1*scaling), passY-(y1*scaling), passX-(50*scaling), passY-(y2*scaling));
  canvas.triangle(passX, passY-(y1*scaling), passX+(x1*scaling), passY-(y1*scaling), passX+(50*scaling), passY-(y2*scaling));
  canvas.rect(passX, passY-(y1*scaling)-(10*scaling), 35*scaling, 35*scaling);

  canvas.popMatrix();

  if (siz > 5)
  {
    drawShape(passX, passY, siz - 20, Y1, X1, Y2);
  }
}

//  Calculate resizing
void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

