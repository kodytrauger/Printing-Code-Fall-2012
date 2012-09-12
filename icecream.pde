// 16 Ice Cream Cone Permutations.
// One Rectangle, Ellipse, and Triangle. 
// Fill and Stroke change according to specifications. 

//Kody Trauger 9/11/12

PGraphics canvas;
int canvas_width = 2550;
int canvas_height = 3300;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup()
{ 
  size(1300, 850);
  background(30);


  canvas = createGraphics(canvas_width, canvas_height, P2D);

  calculateResizeRatio();

  canvas.beginDraw();
  canvas.background(0);

  canvas.noStroke();

  canvas.fill(255);  //--------------<<<CANVAS BACKGROUND
  canvas.stroke(15);
  canvas.strokeWeight(15);
  canvas.fill(255);

  rectMode(CENTER); //-------------<<<RECTANGLE
  canvas.stroke(0);
  canvas.strokeWeight(15);
  canvas.fill(255);
  canvas.rect(300, 300, 1950, 2700);

  ellipseMode(CENTER); //-------------<<<<ICE CREAM
  canvas.stroke(0);
  canvas.strokeWeight(15);
  canvas.fill(255);
  canvas.ellipse(1275, 975, 900, 900);


  canvas.stroke(0);//--------------------<<<<CONE
  canvas.strokeWeight(15);
  canvas.fill(255);
  canvas.triangle(1275, 2775, 850, 1125, 1700, 1125);

  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  //canvas.save("sketch.png");
}



//  Calculate resizing

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}




// Code Citation -Rune Madsen
