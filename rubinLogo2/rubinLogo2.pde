PGraphics canvas;
int canvas_width = 4000;
int canvas_height = 7800;

int h =0;
int s =100;
int b = 100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

int floorNum = 18;
//boolean oneFloor = false;

PFont font;

void setup()
{ 
  size(500, 500, P2D);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 20);
  canvas = createGraphics(canvas_width, canvas_height, P2D);
  calculateResizeRatio();

  //initialize color(s)
  //highlighted floor color
  HSBColor hL = new HSBColor(173, 35, 85);

  //initialize grid(s)
  ModularGrid moduleGrid = new ModularGrid(5, 16, 0, 200);  //number of columns, rows, gutter size, page margin

  font = loadFont("Castellar-235.vlw");


  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100);
  canvas.background(360);
  canvas.smooth();

  for (int i = 0; i < 16; i++) {

    //draw each floor 
    //take into consideration no 13th floor
    if (floorNum >= 14 && floorNum <=17) {
      
      h = round(random(5, 10));
      s = round(random(45, 83));
      b = round(random(50, 61));
      canvas.fill(h, s, b);
      canvas.stroke(360);
      canvas.strokeWeight(100);
      canvas.rect(moduleGrid.modules[0][i].x, moduleGrid.modules[0][i].y, moduleGrid.modules[0][i].w*5, moduleGrid.modules[0][i].h);

      //highlighted floor
      canvas.strokeWeight(100);
      canvas.fill(hL.h, hL.s, hL.b);
      canvas.rect(moduleGrid.modules[0][17-floorNum].x, moduleGrid.modules[0][17-floorNum].y, moduleGrid.modules[0][floorNum-2].w*5, moduleGrid.modules[0][floorNum-2].h);
    }

    if (floorNum >= 0 && floorNum <=12) {

      h = round(random(5, 10));
      s = round(random(45, 83));
      b = round(random(50, 61));
      canvas.fill(h, s, b);
      canvas.stroke(360);
      canvas.strokeWeight(100);
      canvas.rect(moduleGrid.modules[0][i].x, moduleGrid.modules[0][i].y, moduleGrid.modules[0][i].w*5, moduleGrid.modules[0][i].h);

      //highlighted floor
      canvas.strokeWeight(100);
      canvas.fill(hL.h, hL.s, hL.b);
      canvas.rect(moduleGrid.modules[0][16-floorNum].x, moduleGrid.modules[0][16-floorNum].y, moduleGrid.modules[0][floorNum-1].w*5, moduleGrid.modules[0][floorNum-1].h);
    }

    //no floor
    if (floorNum == 18) {

      h = round(random(5, 10));
      s = round(random(45, 83));
      b = round(random(50, 61));
      canvas.fill(h, s, b);
      canvas.stroke(360);
      canvas.strokeWeight(100);
      canvas.rect(moduleGrid.modules[0][i].x, moduleGrid.modules[0][i].y, moduleGrid.modules[0][i].w*5, moduleGrid.modules[0][i].h);
      canvas.noFill();
      
    }
  }

  //building name
  canvas.fill(360);
  canvas.textFont(font, 400);
  canvas.textAlign(CENTER, BASELINE);
  int textColumn = 0;
  int textColumn2 = 6;
  //int textAdjustment = 50;
  //canvas.text("R",moduleGrid.modules[textColumn][4].x+ (moduleGrid.modules[textColumn][4].w/2)-textAdjustment, moduleGrid.modules[textColumn][4].y);
  //canvas.text("U",moduleGrid.modules[textColumn][6].x+ (moduleGrid.modules[textColumn][6].w/2)-textAdjustment, moduleGrid.modules[textColumn][6].y);
  //canvas.text("B",moduleGrid.modules[textColumn][8].x+ (moduleGrid.modules[textColumn][8].w/2)-textAdjustment, moduleGrid.modules[textColumn][8].y);
  //canvas.text("I",moduleGrid.modules[textColumn][10].x+ (moduleGrid.modules[textColumn][10].w/2)-textAdjustment, moduleGrid.modules[textColumn][10].y);
  //canvas.text("N",moduleGrid.modules[textColumn][12].x+ (moduleGrid.modules[textColumn][12].w/2)-textAdjustment, moduleGrid.modules[textColumn][12].y);
  //
  //canvas.text("H",moduleGrid.modules[textColumn2][5].x+ (moduleGrid.modules[textColumn2][5].w/2), moduleGrid.modules[textColumn2][5].y);
  //canvas.text("A",moduleGrid.modules[textColumn2][7].x+ (moduleGrid.modules[textColumn2][7].w/2), moduleGrid.modules[textColumn2][7].y);
  //canvas.text("L",moduleGrid.modules[textColumn2][9].x+ (moduleGrid.modules[textColumn2][9].w/2), moduleGrid.modules[textColumn2][9].y);
  //canvas.text("L",moduleGrid.modules[textColumn2][11].x+ (moduleGrid.modules[textColumn2][11].w/2), moduleGrid.modules[textColumn2][11].y);
 
  //Floor numbers
  canvas.fill(360);
  canvas.textFont(font, 3000);
  if (floorNum ==17) {
    canvas.textAlign(CENTER, TOP);
    canvas.text("17", moduleGrid.modules[2][0].x+ (moduleGrid.modules[2][0].w/2), moduleGrid.modules[2][0].y +moduleGrid.modules[2][0].h-380);
  }

  if (floorNum ==16) {
    canvas.textAlign(CENTER, TOP);
    canvas.text("16", moduleGrid.modules[2][1].x+ (moduleGrid.modules[2][1].w/2), moduleGrid.modules[2][1].y -moduleGrid.modules[2][1].h+120);
  }

  if (floorNum ==15) {
    canvas.textAlign(CENTER, TOP);
    canvas.text("15", moduleGrid.modules[2][2].x+ (moduleGrid.modules[2][2].w/2), moduleGrid.modules[2][2].y -moduleGrid.modules[2][2].h -350);
  }

  if (floorNum ==14) {
    canvas.textAlign(CENTER, TOP);
    canvas.text("14", moduleGrid.modules[2][3].x+ (moduleGrid.modules[2][3].w/2), moduleGrid.modules[2][3].y -moduleGrid.modules[2][3].h-350);
  }

  if (floorNum ==12) {
    canvas.textAlign(CENTER, TOP);
    canvas.text("12", moduleGrid.modules[2][4].x+ (moduleGrid.modules[2][4].w/2), moduleGrid.modules[2][4].y -moduleGrid.modules[2][4].h-350);
  }

  if (floorNum ==11) {
    canvas.textAlign(CENTER, TOP);
    canvas.text("11", moduleGrid.modules[2][5].x+ (moduleGrid.modules[2][5].w/2), moduleGrid.modules[2][5].y -moduleGrid.modules[2][5].h-350);
  }

  if (floorNum ==10) {
    canvas.textAlign(CENTER, TOP);
    canvas.text("10", moduleGrid.modules[2][6].x+ (moduleGrid.modules[2][6].w/2), moduleGrid.modules[2][6].y -moduleGrid.modules[2][6].h-350);
  }

  if (floorNum ==9) {
    canvas.textAlign(CENTER, TOP);
    canvas.text("9", moduleGrid.modules[2][7].x+ (moduleGrid.modules[2][7].w/2), moduleGrid.modules[2][7].y -moduleGrid.modules[2][7].h-350);
  }


  if (floorNum ==8) {
    canvas.textAlign(CENTER, TOP);
    canvas.text("8", moduleGrid.modules[2][8].x+ (moduleGrid.modules[2][8].w/2), moduleGrid.modules[2][8].y -moduleGrid.modules[2][8].h-350);
  }


  if (floorNum ==7) {
    canvas.textAlign(CENTER, TOP);
    canvas.text("7", moduleGrid.modules[2][9].x+ (moduleGrid.modules[2][9].w/2), moduleGrid.modules[2][9].y -moduleGrid.modules[2][9].h-375);
  }


  if (floorNum ==6) {
    canvas.textAlign(CENTER, TOP);
    canvas.text("6", moduleGrid.modules[2][10].x+ (moduleGrid.modules[2][10].w/2), moduleGrid.modules[2][10].y -moduleGrid.modules[2][10].h-350);
  }

  if (floorNum ==5) {
    canvas.textAlign(CENTER, TOP);
    canvas.text("5", moduleGrid.modules[2][11].x+ (moduleGrid.modules[2][11].w/2), moduleGrid.modules[2][11].y -moduleGrid.modules[2][11].h-350);
  }


  if (floorNum ==4) {
    canvas.textAlign(CENTER, TOP);
    canvas.text("4", moduleGrid.modules[2][12].x+ (moduleGrid.modules[2][12].w/2), moduleGrid.modules[2][12].y -moduleGrid.modules[2][12].h-350);
  }

  if (floorNum ==3) {
    canvas.textAlign(CENTER, TOP);
    canvas.text("3", moduleGrid.modules[2][13].x+ (moduleGrid.modules[2][13].w/2), moduleGrid.modules[2][13].y-moduleGrid.modules[2][12].h-350);
  }

  if (floorNum ==2) {
    canvas.textAlign(CENTER, BASELINE);
    canvas.text("2", moduleGrid.modules[2][15].x+ (moduleGrid.modules[2][15].w/2), moduleGrid.modules[2][15].y+moduleGrid.modules[2][12].h-100);
  }

  if (floorNum ==1) {
    canvas.textAlign(CENTER, BOTTOM);
    canvas.text("1", moduleGrid.modules[2][15].x+ (moduleGrid.modules[2][15].w/2), moduleGrid.modules[2][15].y+moduleGrid.modules[2][12].h-100);
  }
  canvas.endDraw();

  //display the grid
  //moduleGrid.display();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("redAll.tiff");
}

//  Calculate resizing
void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

