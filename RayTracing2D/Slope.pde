class Slope {
  
  boolean isVertical;
  float slopeValue;
  float angle;
  
  Slope(boolean v) {
    isVertical   = v;
    slopeValue = 0;
    angle      = 0;
  }
  
  Slope(float sVal) {
    isVertical = false;
    slopeValue = sVal;
    angle      = tan(sVal);
  }
}
