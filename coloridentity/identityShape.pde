class identityShape
{
  int sx;
  int sy;
  int ex;
  int ey;
  int w;

  identityShape () //initialize
  {
    sx = round(random(canvas.width/2, canvas.width- 50));
    sy = round(random(canvas.height - 100));
    ex = round(random(canvas.width));
    ey = round(random(50, canvas.height-50));
    w = round(random(50, 100));
  }

  identityShape ( int _sx, int _sy, int _ex, int _ey, int _w) //pass through the coordinates of shape
  {
    sx = _sx;
    sy = _sy;
    ex = _ex;
    ey = _ey;
    w = _w;
  }

  void display(int h, int s, int b) //get the fill color
  {

    canvas.colorMode(HSB, 360, 100, 100);
    canvas.fill(h, s, b);
    canvas.noStroke();

    canvas.beginShape(POLYGON);
    canvas.curveVertex(sx, sy);
    canvas.curveVertex(sx+w, sy);
    canvas.curveVertex(ex, ey);
    canvas.curveVertex((ex-sx)+ex+w, (ey-sy)+ey);
    canvas.curveVertex((ex-sx)+ex, (ey-sy)+ey);
    canvas.curveVertex(ex, ey);
    canvas.vertex(sx, sy);
    canvas.endShape();
  }
}

