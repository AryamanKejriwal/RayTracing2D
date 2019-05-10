class Point {
  
  float x;
  float y;
  
  boolean isNull = false;
  
  Point(float X, float Y) {
    x = X;
    y = Y;
  }
  
  Point(boolean n) {
    isNull = n;
    
    x = 0;
    y = 0;
  }
  
  boolean equals(Point other) {
    return((this.x == other.x) && (this.y == other.y));
  }
}
