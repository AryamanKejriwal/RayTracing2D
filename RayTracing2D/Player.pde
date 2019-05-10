class Player {
  
  Point position;
  int rayNum;
  Ray[] rays;
  
  Player(float x, float y, int ray) {
    position = new Point(x, y);
    rayNum   = ray;
    rays     = new Ray[ray];
  }
  
  Player(Point pos, int ray) {
    position = new Point(pos.x, pos.y); 
    rayNum   = ray;
    rays     = new Ray[ray];
  }
  
  void update(Point pos) {
    position = pos;
    
    calculateRays();
  }
  
  void calculateRays() {
    float angleDiff = (2 * PI)/(rayNum - 1);
    
    for(int i = 0; i < rayNum; i++) {
      float angle = angleDiff * i;
      
      Slope m;
      try {
        m = new Slope(tan(angle));
      } catch(Exception e) {
        m = new Slope(true);
        //print("v");
      }
      
      Point start = new Point(position.x, position.y);
      Point end;
      
      if(m.isVertical) {
        stroke(255, 0, 0);
        if(angle <= PI) {
          end = new Point(position.x, height);
        } else {
          end = new Point(position.x, 0);
        }
          
      } else {
        //stroke(255);
        if(angle > HALF_PI && angle < (3 * PI)/2) {
          end = new Point(0, m.slopeValue * 0 + (start.y - m.slopeValue * start.x));
        } else {
          end = new Point(width, m.slopeValue * width + (start.y - m.slopeValue * start.x));
        }
      }
       
      Ray r = new Ray(start, end);
      r.intersect(position);
        
      rays[i] = r;
    }//end of for loop
    
  }
  
  void show() {
    for(int i = 0; i < rayNum; i++) {
      //if(rays[i].equation.slope.isVertical) {
      //  fill(255, 0, 0);
      //} else {
      //  fill(255);
      // }
      //colorMode(HSB);
      //stroke((255.0 * i)/rayNum, 255, 255);
      rays[i].show();
      //colorMode(RGB);
    }
    
    ellipse(position.x, position.y, 5, 5);
  }
  
}
