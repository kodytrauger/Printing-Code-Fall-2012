class Module // a module. module's have x, y,height and width..(could have any properties tho)
{
  float x;
  float y;
  float w;
  float h;
  
  Module() // or Module's have no properties
  {
    
  }
 
  Module(float _x, float _y, float _w, float _h) // pass in the information
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }
}
