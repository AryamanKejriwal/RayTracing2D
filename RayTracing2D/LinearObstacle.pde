class LinearObstacle {
  
  SimultaneousEquation equation;
  
  float thickness;
  
  int r;
  int g;
  int b;
  int a;
  
  LinearObstacle(Point start, Point end, float t, int R, int G, int B, int A) {
    equation = new SimultaneousEquation(start, end);
    
    thickness = t;
    
    r = R;
    g = G;
    b = B;
    a = A;
  }
  
  void show() {
    stroke(r, b, g, a);
    strokeWeight(thickness);
    
    Point start = equation.startPoint;
    Point end   = equation.endPoint;
    line(start.x, start.y, end.x, end.y);
  }
}
