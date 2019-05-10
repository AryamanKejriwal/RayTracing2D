class Solutions {
  
  Point[] solutions;
  
  int solutionNum;
  int nonNullSolutions;
  
  Solutions(Point[] s) {
    solutions = s;
    solutionNum = s.length;
    
    int Null = 0;
    
    for(int i = 0; i < s.length; i++) {
      if(s[i].isNull) {
        Null++;
      }
    }
    
    nonNullSolutions = s.length - Null;
  }
  
}
