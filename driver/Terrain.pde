public class Terrain{
protected PImage back;
protected PImage road;
protected int roady = 0;
protected int counter;
protected int by = 0, by2 = 600;

protected boolean genRoad = false;

protected PImage mid;
protected int my = 0, my2 = 600;

protected PImage fore;
protected int fy = 0, fy2 = 600;

void move() {
  if(keyPressed){
  if (key == CODED) {
    if (keyCode == DOWN) {
      by--; by2--;
      my--; my2--;
      fy--; fy2--;
      roady--;
      counter --;
      generateRoads();
      
      
    }
    if (keyCode == UP) {
      by++; by2++;
      my++; my2++;
      fy++; fy2++;
      roady++;
      counter ++;
      System.out.println(counter);
      generateRoads();
    }
  }
}
}

//RIGHT NOW IF YOU SURPASS 5000 STEPS YOU PRACTICALLY WIN SINCE OBSTACLES WON'T GENERATE ANYMORE
protected void generateRoads(){
  road = loadImage("shortRoad.png");
  road.resize(800, 80);
  int speedUp = counter / 100;
  if (counter % (50 -speedUp) == 0){ //what about winning a game? how should we do that?
    
    genRoad = true;
    
  }  
  
  
}
}
