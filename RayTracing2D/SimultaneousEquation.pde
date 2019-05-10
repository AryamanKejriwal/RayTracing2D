class SimultaneousEquation {
  
  //Ax + By + C = 0
  float A;
  float B;
  float C;
  
  Slope slope;
  
  Point startPoint;
  Point endPoint;
  
  
  SimultaneousEquation(Point start, Point end) {
    if(start.x <= end.x) {
      startPoint = new Point(start.x, start.y);
      endPoint   = new Point(end.x, end.y);
    } else {
      startPoint = new Point(end.x, end.y);
      endPoint   = new Point(start.x, start.y);
    }
    
    if(start.x != end.x) {
      slope = new Slope((end.y - start.y)/(end.x - start.x));
    } else {
      slope = new Slope(true);
    }
    
    if(!slope.isVertical) {
      A = slope.slopeValue;
      B = -1;
      C = start.y - (slope.slopeValue * start.x);
    } else {
      A = 1;
      B = 0;
      C = -start.x;
    }
  }
  
  Solutions solve(SimultaneousEquation other) {
    Point[] s = new Point[1];
    
    if((this.slope.slopeValue == other.slope.slopeValue) && !(this.slope.isVertical || other.slope.isVertical)) {
      s[0] = new Point(true);
      
    } else if(this.slope.isVertical && other.slope.isVertical) {
      s[0] = new Point(true);
      
    } else if(this.slope.isVertical) {
      Point p = new Point(this.startPoint.x, (other.slope.slopeValue * this.startPoint.x) + other.C);
      s[0] = p;
      
    } else if(other.slope.isVertical) {
      Point p = new Point(other.startPoint.x, (this.slope.slopeValue * other.startPoint.x) + this.C);
      s[0] = p;
      
    } else {
      float x = (other.C - this.C)/(this.A - other.A);
      float y = x * this.slope.slopeValue + this.C;
      s[0] = new Point(x, y);
      
    }
    
    boolean exceptionA = (s[0].x >= this.startPoint.x && s[0].x <= this.endPoint.x)||(s[0].x <= this.startPoint.x && s[0].x >= this.endPoint.x);
    boolean exceptionB = (s[0].x >= other.startPoint.x && s[0].x <= other.endPoint.x)||(s[0].x <= other.startPoint.x && s[0].x >= other.endPoint.x);
    
    boolean exceptionX = !(exceptionA && exceptionB);
    
    exceptionA = (s[0].y >= this.startPoint.y && s[0].y <= this.endPoint.y)||(s[0].y <= this.startPoint.y && s[0].y >= this.endPoint.y);
    exceptionB = (s[0].y >= other.startPoint.y && s[0].y <= other.endPoint.y)||(s[0].y <= other.startPoint.y && s[0].y >= other.endPoint.y);
 
    boolean exceptionY = !(exceptionA && exceptionB);
   
    
    if(exceptionX || exceptionY) {
    //boolean exception = !((s[0].x > this.startPoint.x && s[0].x < this.startPoint.x) && (s[0].x > other.startPoint.x && s[0].x < other.startPoint.x));
   
    //if(exception) {
      s[0] = new Point(true);
    }
    
    return(new Solutions(s));
  }
}
