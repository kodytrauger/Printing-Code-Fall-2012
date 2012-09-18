PGraphics canvas;
int canvas_width = 3300;
int canvas_height = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup()
{ 
  size(1200, 1200);
  background(70);
  smooth();

  canvas = createGraphics(canvas_width, canvas_height, P2D);

  calculateResizeRatio();

  canvas.beginDraw();
  canvas.smooth();

  canvas.background(255);
  canvas.noStroke();

// large circle shapes
  int circleRadius1 = 700;
  float numVertices1 = 30;
  float vertexDegree1 = 360 / numVertices1;

// small circle shapes
  int circleRadius2 = 500;
  float numVertices2 = 45;
  float vertexDegree2 = 360 / numVertices2;
  
  //tine circle shapes
  int circleRadius3 = 300;
  float numVertices3 = 40;
  float vertexDegree3 = 360/numVertices3;

  canvas.noStroke();
  
  //center large circle thing
  canvas.pushMatrix();
  canvas.translate(canvas.width / 2, (canvas.height / 4)+50); 
  canvas.beginShape();
  for (int i = 0; i < numVertices1; i++)// for every vertex
  {
    float x = cos(radians(i * vertexDegree1)) * (circleRadius1 +random(-200, 200));//x coordinate of vertex equals the cos of the next vertex degree times the shape radius + a random number
    float y = sin(radians(i * vertexDegree1)) * (circleRadius1 +random(-200, 200));//y coordinate of vertex equals the sin of the next vertex degree times the shape radius + a random number
    canvas.fill(0,random(50,200));
    canvas.curveVertex(x, y);
  }
  canvas.endShape();
  canvas.popMatrix();
  
// left small circle thing
  canvas.pushMatrix();
  canvas.translate(canvas.width/4, (canvas.height / 4)); 
  canvas.beginShape();
  for (int i = 0; i < numVertices2; i++)// for every vertex
  {
    float x = cos(radians(i * vertexDegree2)) * (circleRadius2 +random(-100, 100));//x coordinate of vertex equals the cos of the next vertex degree times the shape radius + a random number
    float y = sin(radians(i * vertexDegree2)) * (circleRadius2 +random(-50, 50));//y coordinate of vertex equals the sin of the next vertex degree times the shape radius + a random number
    canvas.fill(0,random(50,200));
    canvas.curveVertex(x, y);
  }
  canvas.endShape();
  canvas.popMatrix();

//right small circle thing
  canvas.pushMatrix();
  canvas.translate((canvas.width/4)*3, (canvas.height / 4)); 
  canvas.beginShape();
  for (int i = 0; i < numVertices2; i++)// for every vertex
  {
    float x = cos(radians(i * vertexDegree2)) * (circleRadius2 +random(-100, 100));//x coordinate of vertex equals the cos of the next vertex degree times the shape radius + a random number
    float y = sin(radians(i * vertexDegree2)) * (circleRadius2 +random(-50, 50));//y coordinate of vertex equals the sin of the next vertex degree times the shape radius + a random number
    canvas.fill(0,random(50,200));
    canvas.curveVertex(x, y);
  }
  canvas.endShape();
  canvas.popMatrix();
  
  // top left small circle thing
  canvas.pushMatrix();
  canvas.translate(canvas.width/4+250, (canvas.height / 4-350)); 
  canvas.beginShape();
  for (int i = 0; i < numVertices2; i++)// for every vertex
  {
    float x = cos(radians(i * vertexDegree2)) * (circleRadius2 +random(-100, 100));//x coordinate of vertex equals the cos of the next vertex degree times the shape radius + a random number
    float y = sin(radians(i * vertexDegree2)) * (circleRadius2 +random(-50, 50));//y coordinate of vertex equals the sin of the next vertex degree times the shape radius + a random number
    canvas.fill(0, random(50,200));
    canvas.curveVertex(x, y);
  }
  canvas.endShape();
  canvas.popMatrix();

//top right small circle thing
  canvas.pushMatrix();
  canvas.translate((canvas.width/4)*3-250, (canvas.height / 4)-350); 
  canvas.beginShape();
  for (int i = 0; i < numVertices2; i++)// for every vertex
  {
    float x = cos(radians(i * vertexDegree2)) * (circleRadius2 +random(-100, 100));//x coordinate of vertex equals the cos of the next vertex degree times the shape radius + a random number
    float y = sin(radians(i * vertexDegree2)) * (circleRadius2 +random(-50, 50));//y coordinate of vertex equals the sin of the next vertex degree times the shape radius + a random number
    canvas.fill(0,random(0,200));
    canvas.curveVertex(x, y);
  }
  canvas.endShape();
  canvas.popMatrix();
  
  //right tiny circle thing
  canvas.pushMatrix();
  canvas.translate((canvas.width/4)*3+450, (canvas.height / 4)-200); 
  canvas.beginShape();
  
  for (int i = 0; i < numVertices3; i++)// for every vertex
  {
    float x = cos(radians(i * vertexDegree3)) * (circleRadius3 +random(-100, 100));//x coordinate of vertex equals the cos of the next vertex degree times the shape radius + a random number
    float y = sin(radians(i * vertexDegree3)) * (circleRadius3 +random(-50, 50));//y coordinate of vertex equals the sin of the next vertex degree times the shape radius + a random number
    canvas.fill(0,random(50,200));
    canvas.curveVertex(x, y);
  }
  canvas.endShape();
  canvas.popMatrix();
  
  
    //left tiny circle thing
  canvas.pushMatrix();
  canvas.translate(canvas.width/4-430, (canvas.height / 4)-200); 
  canvas.beginShape();
  
  for (int i = 0; i < numVertices3; i++)// for every vertex
  {
    float x = cos(radians(i * vertexDegree3)) * (circleRadius3 +random(-100, 100));//x coordinate of vertex equals the cos of the next vertex degree times the shape radius + a random number
    float y = sin(radians(i * vertexDegree3)) * (circleRadius3 +random(-50, 50));//y coordinate of vertex equals the sin of the next vertex degree times the shape radius + a random number
    canvas.fill(0,random(50,200));
    canvas.curveVertex(x, y);
  }
  canvas.endShape();
  canvas.popMatrix();
  
 
//lip lines
  canvas.pushMatrix();
  canvas.translate(100, (canvas.height / 4)-150); 
  canvas.beginShape();
  
  int prevX = 0;
  int prevY = 0;
  
  for (int i = 0; i < 65; i++)  
  {
    canvas.fill(255);
    
    float x = (i * 50);
   
    float y = (i * 9)- 130;
    
    
    //  curve 2 -straight
   if (x>1200 && x<=2000){
      y = (i)+70;
   }
//    curve2 -up
    if(x>2000){
      y = (i*-9)+470;
    }

    canvas.fill(255, 50);
    canvas.ellipse(x,y,50,50);
    
     x = prevX;
     y = prevY;
  }
  canvas.endShape();
  canvas.popMatrix();


//top frontal cortex
  canvas.pushMatrix();
  canvas.translate((canvas.width/2-1400), (canvas.height / 4 *2)+300); 
  canvas.beginShape();
  for (int i = 0; i < 10; i++)  //for every i less than 40, add one to i
  {
    canvas.fill(0, random(0, 200));
    canvas.triangle(random(0, 750), random(500, 1000), random(0, 750), random(1000, 1000), random(0, 750), random(0, 1000));
  }
  canvas.endShape();
  canvas.popMatrix();
  
  //bottom frontal cortex
  canvas.pushMatrix();
  canvas.translate((canvas.width/2-1400), (canvas.height / 4 *2)+900); 
  canvas.beginShape();
  for (int i = 0; i < 10; i++)  //for every i less than 40, add one to i
  {
    canvas.fill(0, random(0, 200));
    rotate(PI);
    canvas.triangle(random(0, 750), random(500, 1000), random(0, 750), random(1000, 1000), random(0, 750), random(0, 1000));
  }
  canvas.endShape();
  canvas.popMatrix();
  
  
  //top midbrain
  canvas.pushMatrix();
  canvas.translate((canvas.width/2-1000), (canvas.height / 4 *2)-200); 
  canvas.beginShape();
  for (int i = 0; i < 20; i++)  //for every i less than 40, add one to i
  {
    canvas.fill(0, random(0, 200));
    canvas.triangle(random(0, 1350), random(500, 1600), random(0, 1350), random(1000, 1600), random(0, 1350), random(0, 1600));
  }
  canvas.endShape();
  canvas.popMatrix();
  
  //bottom mid brain
    canvas.pushMatrix();
  canvas.translate((canvas.width/2-1000), (canvas.height / 4 *2)+1000); 
  canvas.beginShape();
  for (int i = 0; i < 20; i++)  //for every i less than 40, add one to i
  {
    canvas.fill(0, random(0, 200));
    rotate(PI);
    canvas.triangle(random(0, 1350), random(500, 1500), random(0, 1350), random(1000, 1500), random(0, 1350), random(0, 1500));
  }
  canvas.endShape();
  canvas.popMatrix();
  
    //top brain stem
  canvas.pushMatrix();
  canvas.translate((canvas.width/2)-500, (canvas.height / 4 *2)); 
  canvas.beginShape();
  for (int i = 0; i < 15; i++)  //for every i less than 40, add one to i
  {
    canvas.fill(0, random(0, 200));
    canvas.triangle(random(0, 1800), random(500, 1400), random(0, 1800), random(1000, 1400), random(0, 1800), random(0, 800));
  }
  canvas.endShape();
  canvas.popMatrix();
  
      //bottom brain stem
  canvas.pushMatrix();
  canvas.translate((canvas.width/2)-500, (canvas.height / 4 *2)+850); 
  canvas.beginShape();
  for (int i = 0; i < 15; i++)  //for every i less than 40, add one to i
  {
    canvas.fill(0, random(0, 200));
    canvas.triangle(random(0, 1800), random(500, 1400), random(0, 1800), random(1000, 1400), random(0, 1800), random(0, 800));
  }
  canvas.endShape();
  canvas.popMatrix();
  
  
      //top base
  canvas.pushMatrix();
  canvas.translate((canvas.width/2)+700, (canvas.height / 4 *2)+700); 
  canvas.beginShape();
  for (int i = 0; i < 15; i++)  //for every i less than 40, add one to i
  {
    canvas.fill(0, random(0, 200));
    canvas.triangle(random(0, 800), random(100, 650), random(0, 800), random(100, 650), random(0, 800), random(0, 650));
  }
  canvas.endShape();
  canvas.popMatrix();
  
  
        //bottom base
  canvas.pushMatrix();
  canvas.translate((canvas.width/2)+700, (canvas.height / 4 *2)+1350); 
  canvas.beginShape();
  for (int i = 0; i < 15; i++)  //for every i less than 40, add one to i
  {
    canvas.fill(0, random(0, 200));
    canvas.triangle(random(0, 800), random(100, 650), random(0, 800), random(100, 650), random(0, 800), random(0, 650));
  }
  canvas.endShape();
  canvas.popMatrix();
  
  canvas.endDraw();


  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("8.tif");
}



//  Calculate resizing

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

