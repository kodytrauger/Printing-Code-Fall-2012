//Color Identity
// Kody Trauger
// September 2012

//right split and left split complementary color system

PGraphics canvas;
int canvas_width = 2400;
int canvas_height = 3000;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup()
{ 
  size(1300, 850);
  colorMode(HSB, 360, 0, 0);
  background(0);

  canvas = createGraphics(canvas_width, canvas_height, P2D);

  calculateResizeRatio();

  //create the shapes //width is 40 percent of larger

  //  identityShape shape3 = new identityShape(1789, 215, 1539, 1115, 50);   //diagonal right
  identityShape shape3s = new identityShape(1789, 215, 1539, 1115, 20);  //diagonal right

  //  identityShape shape4 = new identityShape(1531, 177, 1531, 1127, 51);   // vertical right
  identityShape shape4s = new identityShape(1531, 177, 1531, 1127, 20);  // vertical right

  //  identityShape shape5 = new identityShape(1267, 1876, 1267, 2126, 30);  //vertical bottom
  identityShape shape5s = new identityShape(1267, 1876, 1267, 2126, 12); //vertical bottom

  //  identityShape shape6 = new identityShape(1387, 1935, 1266, 2135, 30);  //diagonal bottom
  identityShape shape6s = new identityShape(1387, 1935, 1266, 2135, 12); // diagonal bottom

  //  identityShape shape7 = new identityShape(1503, 710,1362, 1180, 70);   //left diagonal
  identityShape shape7s = new identityShape(1503, 710, 1362, 1180, 28); //left diagonal

  //  identityShape shape8 = new identityShape(1360, 744, 1360, 1187, 70);     //left vertical
  identityShape shape8s = new identityShape(1360, 744, 1360, 1187, 28);  //left vertical

  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 0, 0);
  canvas.background(360);
  canvas.smooth();

  //calculate and create colors--- could be done in a new class? colorSelector?

  HSBColor color1 = new HSBColor(random(90, 360), random(20, 50), random(50, 60));//b1 will always be brighter
  int rightcomplementaryhue = (color1.h + 210) % 360;// 180 +30 to the right.
  int leftcomplementaryhue = (color1.h +150) %360; // 180 -30 to the left
  int newsaturation =(70-color1.s); //less saturation
  int nextsaturation =(60-color1.s); //even less saturation
  int newbrightness = (color1.b+25); // brightest
  int newerbrightness =(color1.b+10); //brighter

  HSBColor color2 = new HSBColor(rightcomplementaryhue, newsaturation, newbrightness);
  HSBColor color3 = new HSBColor(leftcomplementaryhue, newsaturation, newbrightness);
  HSBColor color4 = new HSBColor(leftcomplementaryhue, nextsaturation, newbrightness);
  HSBColor color5 = new HSBColor(rightcomplementaryhue, nextsaturation, newerbrightness);
  HSBColor color6 = new HSBColor(leftcomplementaryhue, nextsaturation, newerbrightness);

  // display the shapes
  
  // shape3.display(color1.h, color1.s, color1.b);
  shape3s.display(color1.h, color1.s, color1.b);
  //shape4.display(color3.h, color3.s, color3.b);
  shape4s.display(color2.h, color2.s, color2.b);
  //shape5.display(color5.h, color5.s, color5.b);
  shape5s.display(color3.h, color3.s, color3.b);
  //shape6.display(color7.h, color7.s, color7.b);
  shape6s.display(color4.h, color4.s, color4.b);
  //shape7.display(color9.h, color9.s, color9.b); 
  shape7s.display(color5.h, color5.s, color5.b);
  // shape8.display(color11.h, color11.s, color11.b);
  shape8s.display(color6.h, color6.s, color6.b);

  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  //canvas.save("sketch20.tif");
}

//  Calculate resizing

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

