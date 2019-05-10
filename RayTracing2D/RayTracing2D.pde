
Player p = new Player(mouseX, mouseY, 128);

LinearObstacle[] o = new LinearObstacle[4];

void setup() {
  size(800, 800);
  background(0);
  
  //o[0] = new LinearObstacle(new Point(500, 500), new Point(200, 500), 3, 255, 255, 255, 255);
  //o[1] = new LinearObstacle(new Point(500, 500), new Point(500, 400), 3, 255, 255, 255, 255);
  //o[2] = new LinearObstacle(new Point(500, 400), new Point(200, 400), 3, 255, 255, 255, 255);
  //o[3] = new LinearObstacle(new Point(200, 400), new Point(200, 500), 3, 255, 255, 255, 255);
  
  o[0] = new LinearObstacle(new Point(500, 500), new Point(200, 600), 3, 255, 255, 255, 255);
  o[1] = new LinearObstacle(new Point(600, 100), new Point(750, 200), 3, 255, 255, 255, 255);
  o[2] = new LinearObstacle(new Point(100, 300), new Point(100, 700), 3, 255, 255, 255, 255);
  o[3] = new LinearObstacle(new Point(400, 200), new Point(600, 200), 3, 255, 255, 255, 255);
}

void draw() {
  background(0);
  
  for(int i = 0; i < o.length; i++) {
    o[i].show();
  }
  
  p.update(new Point(mouseX, mouseY));
  p.show();
  
}

float distSQ(float x1, float x2, float y1, float y2) {
  return(pow((x1 - x2), 2) + pow((y1 - y2), 2));
}
