class Ray {
  SimultaneousEquation equation;
  
  Ray(Point start, Point end) {
    equation = new SimultaneousEquation(start, end);
  }
  
  void intersect(Point pos) {
    //Solutions solution = o[0].equation.solve(this.equation);
    Point[] sol = new Point[1];
    if(pos.equals(equation.endPoint)) {
      sol[0] = new Point(equation.startPoint.x, equation.startPoint.y);
    } else {
      sol[0] = new Point(equation.endPoint.x, equation.endPoint.y);
    }
    
    Solutions solution = new Solutions(sol);
    int solutionNum = 0;
    
    //Solutions solutions = new Solution[o.length];
    
    for(int i = 0; i < o.length; i++) {
      //solutions[i] = o[i].equation.solve(this.equation);
      Solutions s = o[i].equation.solve(this.equation);
      if(s.nonNullSolutions > 0) {
        for(int j = 0; j < s.solutions.length; j++) {
          if(!(s.solutions[j].isNull)) {
            if(distSQ(pos.x, s.solutions[j].x, pos.y, s.solutions[j].y) < distSQ(pos.x, solution.solutions[j].x, pos.y, solution.solutions[j].y)) {
              solution = s;
              solutionNum = j;
              
            } 
          }
        }
      }
    }
    
    if(solution.nonNullSolutions > 0) {
      Point end = solution.solutions[solutionNum];
      Point start = pos;
      equation = new SimultaneousEquation(start, end);
    }
    
  }
  
  void show() {
    stroke(255);
    strokeWeight(3);
    
    Point start = equation.startPoint;
    Point end   = equation.endPoint;
    line(start.x, start.y, end.x, end.y);
  }
}
