//Onion

//to do.... make all letters.

PGraphics canvas;
int canvas_width = 3300;
int canvas_height = 2500;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

// x1, y1, radius1, startdegree1, enddegree1, rotation1, x2, y2, radius2, startdegree2, enddegree2,rotation2,x3, y3, radius3, startdegree3, enddegree3,rotation3, right spacing
float[][] letters = {    // array within an array. load each letters info into the main 'letters' array
  //{ 150, 0, 300, 62, 56}, // A
 // { 60, 103, 105, -90, 180}, // B
 // { 165, 150, 150, 60, 245}, // C
 // { 80, 150, 148, -90, 180}, // D
 // { 165, 150, 150, 53, 260}, // E
 // { 165, 150, 150, 90, 230}, // F
 // { 165, 150, 150, 55, 245}, // G
 // { 30, 150, 150, -90, 180}, // H
    { canvas_width/2, canvas_height/2, 300, 0, 360,0, canvas_width/2,canvas_height/2,250,0,360,0,canvas_width/2,canvas_height/2,350,0,0,0,720}, // O
    { canvas_width/2, canvas_height/2, 300, 120, 240,0, canvas_width/2,canvas_height/2,250,130,330,90,canvas_width/2,canvas_height/2,300,0,0,0,670}, // N
    { canvas_width/2, canvas_height/2, 250, 120, 240,0, canvas_width/2,canvas_height/2,300,220,260,0,canvas_width/2,canvas_height/2,300,100,140,0,350}, // I
    { canvas_width/2, canvas_height/2, 300, 0, 360,0, canvas_width/2,canvas_height/2,250,0,360,0,canvas_width/2,canvas_height/2,350,0,0,0,720}, // O
    { canvas_width/2, canvas_height/2, 300, 120, 240,0, canvas_width/2,canvas_height/2,250,130,330,90,canvas_width/2,canvas_height/2,300,0,0,0,670}, // N
    
  //{ canvas_width/2, canvas_height/2, 300, 0, 220,270, canvas_width/2,canvas_height/2,250,0,0,90,canvas_width/2,canvas_height/2,300,0,0,0,670}, // J
// { canvas_width/2, canvas_height/2, 300, 120, 240,0, canvas_width/2,canvas_height/2,250,220,300,0,canvas_width/2,canvas_height/2,250,60,140,0,670}, // K
// { canvas_width/2, canvas_height/2, 300, 135, 225,0, canvas_width/2,canvas_height/2,250,45,140,0,canvas_width/2,canvas_height/2,250,0,0,0,670}, // L
 // { -30, 306, 300, 277, 42}, // M
 
 // { 150, 110, 110, 0, 360}, // P
  //{ 145, 150, 143, -90, 360}, // Q
 // { 50, 310, 310, 270, 40}, // R
  //{ 153, 95, 95, 90, 233}, // S
 // { 150, 130, 130, 180, 180}, // T
 // { 150, 150, 150, -70, 250}, // U
 // { 150, 300, 300, -242, -56}, // V
 // { 35, 160, 145, 245, 180}, // W
  //{ 150, 80, 95, -50, 280}, // X
  //{ 140, 90, 100, 60, 180}, // Y
 // {30, 20, 240, 0, 45} // Z
};

// if we want the letters smaller, multiply their numbers by this float
float scaling = 1;

void setup()
{ 
  size(1300, 850);
  background(30);

  canvas = createGraphics(canvas_width, canvas_height, P2D);

  calculateResizeRatio();

  canvas.beginDraw();
  canvas.background(255);
  canvas.smooth();
  canvas.stroke(20);
  
   for(int i = 0; i < letters.length; i++) //scale radius's
  {
    letters[i][2] = letters[i][2] * scaling;
    letters[i][8] = letters[i][8] * scaling;
    letters[i][14] = letters[i][14] * scaling;
  }
  
  canvas.translate(-canvas.width/2+(415*scaling), 0); //set starting point for letters
  
  // draw normal letters
  int xPos = 0;
  int yPos = 0;
  
  for(int i = 0; i < letters.length; i++)
  {
    canvas.pushMatrix();
    canvas.translate(xPos, yPos);

    drawPie(letters[i][0], letters[i][1], letters[i][2], letters[i][3], letters[i][4], letters[i][5]);    //draw the pieces of each letter
    drawPie(letters[i][6], letters[i][7], letters[i][8], letters[i][9], letters[i][10], letters[i][11]);
    drawPie(letters[i][12], letters[i][13], letters[i][14], letters[i][15], letters[i][16], letters[i][17]);
    
    canvas.popMatrix(); 
    
    xPos += letters[i][18] * scaling; // go to the next letter
    
    if(xPos >= canvas.width - (letters[i][18] * scaling)) // if we go beyond the canvas, set x back to 0 and go to the next row
    {
      xPos = 0;
      yPos += 720 * scaling; 
    }
  }

  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("sketch.tif");
}

//  Calculate resizing
void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

void drawPie(float x, float y, float r, float s, float e, float ro)
{
  canvas.pushMatrix();
  canvas.translate(x, y); 
  canvas.rotate(radians(ro)); //rotate the canvas by the degree of each piece of each letter
  canvas.noFill();
  canvas.stroke(0);
  canvas.strokeWeight(40*scaling); //determine width
  canvas.ellipseMode(CENTER);
  canvas.arc(0, 0, r * 2, r * 2, radians(s), radians(e));//center of ellipse is at 0,0. width and heigh of arc's ellipse is 
  // the radius times 2, angle where to start the arc, angle where to stop the arc.
  canvas.popMatrix();
}
