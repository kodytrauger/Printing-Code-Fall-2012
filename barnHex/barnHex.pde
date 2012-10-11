// Barn Hex 


//notes for imporovement:
//**stroke and position needs to be scaleable. create scale variable
//**add more detail to design
//**attempt creating shape classes for the various design componenents

void setup()
{
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  HSBColor reddish = new HSBColor(3, 80, 80);
  HSBColor yellowish = new HSBColor(50, 70, 90);
  HSBColor black = new HSBColor(220, 70, 60); //ended up being blue

  ModularGrid moduleGridV = new ModularGrid(5, 5, 20, 0); //initialize a ColumnGrid. number of columns and page margin. //PURPLE
  ModularGrid moduleGrid = new ModularGrid(7, 7, 1, 0); //pass in number of columns, rows, gutter size and page margin //GREEN

  ellipseMode(CORNER);
  
  //black hex background
  noStroke();
  fill(0);
  ellipse(moduleGrid.modules[0][0].x + moduleGrid.modules[0][0].w/2, moduleGrid.modules[0][0].y + moduleGrid.modules[0][0].h/2, 
  moduleGrid.modules[0][0].w *6, moduleGrid.modules[0][0].h *6);

  //*********************PURPLE GRID************************
  
  //red center ring
  strokeWeight(2);
  stroke(yellowish.h, yellowish.s, yellowish.b); 
  noFill();

  //left red ring
  strokeWeight(2);
  stroke(yellowish.h, yellowish.s, yellowish.b); 
  fill(reddish.h, reddish.s, reddish.b); 
  triangle(moduleGridV.modules[1][2].x+ moduleGridV.modules[1][2].w, moduleGridV.modules[1][2].y, moduleGridV.modules[1][2].x+ 
  (moduleGridV.modules[1][2].w), moduleGridV.modules[1][2].y + (moduleGridV.modules[1][2].h), 
  moduleGridV.modules[1][2].x, moduleGridV.modules[1][2].y + (moduleGridV.modules[1][2].h/2));
  
  //top red ring
  triangle(moduleGridV.modules[2][1].x+ moduleGridV.modules[2][1].w/2, moduleGridV.modules[2][1].y, moduleGridV.modules[2][1].x+ 
  (moduleGridV.modules[2][1].w), moduleGridV.modules[2][1].y + (moduleGridV.modules[2][1].h), 
  moduleGridV.modules[2][1].x, moduleGridV.modules[2][1].y + (moduleGridV.modules[2][1].h));
  
  //right red ring
  triangle(moduleGridV.modules[3][2].x, moduleGridV.modules[3][2].y, moduleGridV.modules[3][2].x+ (moduleGridV.modules[3][2].w), 
  moduleGridV.modules[3][2].y + (moduleGridV.modules[1][2].h/2), 
  moduleGridV.modules[3][2].x, moduleGridV.modules[3][2].y + (moduleGridV.modules[3][2].h));
  
  //bottom red ring
  triangle(moduleGridV.modules[2][3].x, moduleGridV.modules[2][3].y, moduleGridV.modules[2][3].x+ (moduleGridV.modules[2][3].w),
  moduleGridV.modules[2][3].y, 
  moduleGridV.modules[2][3].x + (moduleGridV.modules[2][3].w/2), moduleGridV.modules[2][3].y + (moduleGridV.modules[2][3].h));
 

  //*********************GREEN GRID***********************
  
  //center black
  strokeWeight(1);
  stroke(yellowish.h, yellowish.s, yellowish.b);
  fill(yellowish.h, yellowish.s, yellowish.b);
  ellipse(moduleGrid.modules[3][3].x+20, moduleGrid.modules[3][3].y+20, moduleGrid.modules[3][3].h-40, moduleGrid.modules[3][3].w-40);

  //center red star
  noStroke();
  fill(reddish.h, reddish.s, reddish.b);
  arc(moduleGrid.modules[3][3].x, moduleGrid.modules[3][3].y, moduleGrid.modules[3][3].h, moduleGrid.modules[3][3].w, 
  radians(0), radians(36));
  arc(moduleGrid.modules[3][3].x, moduleGrid.modules[3][3].y, moduleGrid.modules[3][3].h, moduleGrid.modules[3][3].w, 
  radians(72), radians(108));
  arc(moduleGrid.modules[3][3].x, moduleGrid.modules[3][3].y, moduleGrid.modules[3][3].h, moduleGrid.modules[3][3].w, 
  radians(144), radians(180));
  arc(moduleGrid.modules[3][3].x, moduleGrid.modules[3][3].y, moduleGrid.modules[3][3].h, moduleGrid.modules[3][3].w, 
  radians(216), radians(252));
  arc(moduleGrid.modules[3][3].x, moduleGrid.modules[3][3].y, moduleGrid.modules[3][3].h, moduleGrid.modules[3][3].w, 
  radians(288), radians(324));

  //top  left yellow
  strokeWeight(10);
  stroke(black.h, black.s, black.b);
  line(moduleGrid.modules[2][2].x + (moduleGrid.modules[2][2].w/2), moduleGrid.modules[2][2].y, moduleGrid.modules[2][2].x +
  (moduleGrid.modules[2][2].w/2), moduleGrid.modules[2][2].y + moduleGrid.modules[2][2].h);
  line(moduleGrid.modules[2][2].x, moduleGrid.modules[2][2].y + (moduleGrid.modules[2][2].h/2), moduleGrid.modules[2][2].x + 
  moduleGrid.modules[2][2].w, moduleGrid.modules[2][2].y + (moduleGrid.modules[2][2].h/2));
  strokeWeight(21);
  stroke(black.h, black.s, black.b);
  noFill();
  arc(moduleGrid.modules[2][2].x, moduleGrid.modules[2][2].y, moduleGrid.modules[2][2].h, moduleGrid.modules[2][2].w, 
  radians(0), radians(360));

  //bottom right yellow
  strokeWeight(10);
  stroke(black.h, black.s, black.b);
  line(moduleGrid.modules[4][4].x + (moduleGrid.modules[4][4].w/2), moduleGrid.modules[4][4].y, moduleGrid.modules[4][4].x + 
  (moduleGrid.modules[4][4].w/2), moduleGrid.modules[4][4].y + moduleGrid.modules[4][4].h);
  line(moduleGrid.modules[4][4].x, moduleGrid.modules[4][4].y + (moduleGrid.modules[4][4].h/2), moduleGrid.modules[4][4].x +
  moduleGrid.modules[4][4].w, moduleGrid.modules[4][4].y + (moduleGrid.modules[4][4].h/2));
  strokeWeight(25);
  stroke(black.h, black.s, black.b);
  noFill();
  arc(moduleGrid.modules[4][4].x, moduleGrid.modules[4][4].y, moduleGrid.modules[4][4].h, moduleGrid.modules[4][4].w, 
  radians(0), radians(360));

  //bottom left yellow
  strokeWeight(25);
  stroke(black.h, black.s, black.b);
  noFill();
  arc(moduleGrid.modules[2][4].x, moduleGrid.modules[2][4].y, moduleGrid.modules[2][4].h, moduleGrid.modules[2][4].w, 
  radians(0), radians(360));
  //moon
  noStroke();
  fill(yellowish.h, yellowish.s, yellowish.b);
  ellipse(moduleGrid.modules[2][4].x +(moduleGrid.modules[2][4].h/4)-5, moduleGrid.modules[2][4].y +(moduleGrid.modules[2][4].h/4), 
  moduleGrid.modules[2][4].h/2, moduleGrid.modules[2][4].w/2);
  fill(0);
  ellipse(moduleGrid.modules[2][4].x +(moduleGrid.modules[2][4].h/4) - 15, moduleGrid.modules[2][4].y + (moduleGrid.modules[2][4].h/4),
  (moduleGrid.modules[2][4].h-15)/2, moduleGrid.modules[2][4].w/2);

  //top right yellow
  strokeWeight(25);
  stroke(black.h, black.s, black.b);
  noFill();
  arc(moduleGrid.modules[4][2].x, moduleGrid.modules[4][2].y, moduleGrid.modules[4][2].h, moduleGrid.modules[4][2].w, 
  radians(0), radians(360));
  //moon
  noStroke();
  fill(yellowish.h, yellowish.s, yellowish.b);
  ellipse(moduleGrid.modules[4][2].x +(moduleGrid.modules[4][2].h/4)-5, moduleGrid.modules[4][2].y +(moduleGrid.modules[4][2].h/4), 
  moduleGrid.modules[4][2].h/2, moduleGrid.modules[4][2].w/2);
  fill(0);
  ellipse(moduleGrid.modules[4][2].x +(moduleGrid.modules[4][2].h/4) - 15, moduleGrid.modules[4][2].y + (moduleGrid.modules[4][2].h/4),
  (moduleGrid.modules[4][2].h-15)/2, moduleGrid.modules[4][2].w/2);

  //outside ring
  noFill();
  strokeWeight(30);
  stroke(yellowish.h, yellowish.s, yellowish.b);
  ellipse(moduleGrid.modules[0][0].x + moduleGrid.modules[0][0].w, moduleGrid.modules[0][0].y + moduleGrid.modules[0][0].h, 
  moduleGrid.modules[0][0].w *5, moduleGrid.modules[0][0].h *5);
  strokeWeight(50);
  stroke(black.h, black.s, black.b);
  ellipse(moduleGrid.modules[0][0].x + moduleGrid.modules[0][0].w/2, moduleGrid.modules[0][0].y + moduleGrid.modules[0][0].h/2, 
  moduleGrid.modules[0][0].w *6, moduleGrid.modules[0][0].h *6);



  // ************************show both grids on top of each other************************
  
  
  moduleGridV.display(0, 1, 320, 80, 80); //PURPLE
  moduleGrid.display(0, 1, 130, 80, 80); //GREEN
  
  
//*****************************Save Image*************************************


  //saveFrame("hex.tiff");
 
}

