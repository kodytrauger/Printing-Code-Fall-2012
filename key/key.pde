import toxi.util.datatypes.*;
import toxi.geom.*;

PGraphics canvas;

int canvas_width = 2000;
int canvas_height = 2000;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup()
{ 
  size(1300, 850, P3D);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 20);
  canvas = createGraphics(canvas_width, canvas_height, P3D);
  PImage photo1 = loadImage("r.jpg");
  calculateResizeRatio();

  //initialize grid(s)
  ModularGrid moduleGrid = new ModularGrid(10, 10, 20, 50);  //number of columns, rows, gutter size, page margin

  canvas.beginDraw();

  canvas.colorMode(HSB, 360, 100, 100);
  canvas.background(360);
  canvas.smooth();
  canvas.noFill();

  // moduleGrid.display();
  canvas.strokeWeight(5);
  canvas.stroke(120, 70, 80);

  int pointNum = 2;
  int pointWidth = canvas.width / pointNum;
  ArrayList<Vec2D> points = new ArrayList();
  ArrayList<Vec2D> points2 = new ArrayList();
  ArrayList<Vec2D> points3 = new ArrayList();
  ArrayList<Vec2D> points4 = new ArrayList();

  int s1 = 0;
  int s2 = 0;
  if (random(1) > 0.2)   s1= 1;
  else                  s1=5;
  if (random(1) > 0.4)   s2= 9;
  else                  s2=4;

  int c1 = 0;
  if (random(1) > 0.2)   c1= 1;
  else                  c1=5;

  int c2 = 0;
  if (random(1) > 0.7)   c1= 3;
  else                  c2=9;
  // create random points of branch 1 //green
  for (int i = 0; i < pointNum + 1; i++)
  {
    if (i ==0) {

      float x = moduleGrid.modules[s1][s2].x;
      float y = moduleGrid.modules[s1][s2].y + random(-100, 100);
      Vec2D p = new Vec2D(x, y);
      points.add(p);
    }
    if (i ==1) {

      int d = 0;
      if (random(1) > 0.2)   d= 4;
      else                  d=9;

      int j = 0;
      if (random(1) > 0.7)   j= 8;
      else                  j=4;

      float x = moduleGrid.modules[d][j].x;
      float y = moduleGrid.modules[d][j].y + random(-50, 50);
      Vec2D p = new Vec2D(x, y);
      points.add(p);
      //create start point for branch 2
      points2.add(p);
    }

    if (i ==2) {

      float x = moduleGrid.modules[6][3].x;
      float y = moduleGrid.modules[6][3].y + random(-25, 25);
      Vec2D p = new Vec2D(x, y);
      points.add(p);
    }
  }
  //create the rest of the points for branch 2 //purple
  for (int i = 0; i < pointNum + 1; i++) {

    if (i ==1) {
      int d = (int)(random(1, 5));
      int e = (int)(random(1, 5));
      float x = moduleGrid.modules[d][e].x;
      float y = moduleGrid.modules[d][e].y + random(-50, 50);
      Vec2D p = new Vec2D(x, y);
      points2.add(p);
      points3.add(p);
    }
    if (i ==2) {

      float x = moduleGrid.modules[c1][c2].x;
      float y = moduleGrid.modules[c1][c2].y + random(-50, 50);
      Vec2D p = new Vec2D(x, y);
      points2.add(p);
    }
  }
  //create the rest of the points for branch 3 //red
  for (int i = 0; i < pointNum + 1; i++) {

    if (i ==1) {
      int d = 0;
      if (random(1) > 0.2)   d= 2;
      else                  d=5;

      int j = 0;
      if (random(1) > 0.7)   j= 9;
      else                  j=6;

      float x = moduleGrid.modules[d][j].x;
      float y = moduleGrid.modules[d][j].y + random(-50, 50);
      Vec2D p = new Vec2D(x, y);
      points3.add(p);
      points4.add(p);
    }
    if (i ==2) {

      float x = moduleGrid.modules[s1][s2].x;
      float y = moduleGrid.modules[s1][s2].y + random(-50, 50);
      Vec2D p = new Vec2D(x, y);
      points3.add(p);
    }
  }
  //create the points for branch 4 //yellow
  for (int i = 0; i < pointNum + 1; i++) {

    if (i ==1) {
      int d = 0;
      int e = 0;

      if (random(1) > 0.2)   d= 5;
      else                  d=7;
      if (random(1) > 0.8)   e= 5;
      else                  e=8;

      float x = moduleGrid.modules[d][e].x;
      float y = moduleGrid.modules[d][e].y + random(-50, 50);
      Vec2D p = new Vec2D(x, y);
      points4.add(p);
    }
    if (i ==2) {

      float x = moduleGrid.modules[c1][c2].x;
      float y = moduleGrid.modules[c1][c2].y + random(-50, 50);
      Vec2D p = new Vec2D(x, y);
      points4.add(p);
    }
  }


  //draw the first branch
  canvas.fill(0, 50);
  canvas.noStroke();
  //canvas.strokeWeight(1);
  Spline2D spline = new Spline2D(points);

  ArrayList<Vec2D> morePoints = (ArrayList) spline.getDecimatedVertices(300, false);

  canvas.beginShape();
    //  canvas.texture(photo1);
  for (int i = 0; i < morePoints.size(); i++) 
  {
  
    Vec2D p = morePoints.get(i);
    canvas.vertex(p.x, p.y,0,0);
  }
 
  canvas.endShape();

  //draw the 2nd branch
  canvas.fill(90, 50, 60, 200);
  canvas.noStroke();
  //    canvas.strokeWeight(1);
  //  canvas.stroke(280, 80, 80);
  Spline2D spline2 = new Spline2D(points2);
  ArrayList<Vec2D> morePoints2 = (ArrayList) spline2.getDecimatedVertices(300, false);
  canvas.beginShape();
  for (int i = 0; i < morePoints2.size(); i++) 
  {
    Vec2D p = morePoints2.get(i);
    canvas.vertex(p.x, p.y);
  }
  canvas.endShape();

  //draw the 3rd branch
  canvas.fill(200, 50, 90, 150);
  canvas.noStroke();

  Spline2D spline3 = new Spline2D(points3);
  ArrayList<Vec2D> morePoints3 = (ArrayList) spline3.getDecimatedVertices(300, false);
  canvas.beginShape();
  for (int i = 0; i < morePoints3.size(); i++) 
  {
    Vec2D p = morePoints3.get(i);
    canvas.vertex(p.x, p.y);
  }
  canvas.endShape();
  //draw the 4th branch
  canvas.fill(320, 80, 70, 175);
  canvas.noStroke();
 
  Spline2D spline4 = new Spline2D(points4);
  ArrayList<Vec2D> morePoints4 = (ArrayList) spline4.getDecimatedVertices(300, false);
  canvas.beginShape();

  for (int i = 0; i < morePoints4.size(); i++) 
  {
    Vec2D p = morePoints4.get(i);
    canvas.vertex(p.x, p.y);
  }
  
  canvas.endShape();
  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("sketch5.tiff");
}

//  Calculate resizing
void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

