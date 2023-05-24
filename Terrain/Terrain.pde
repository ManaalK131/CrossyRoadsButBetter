PImage back;
PImage road;
int roady = 0;
int counter;
int by = 0, by2 = 600;

boolean genRoad = false;

PImage mid;
int my = 0, my2 = 600;

PImage fore;
int fy = 0, fy2 = 600;


void setup(){
  size(800, 600);
  back = loadImage("grass.png");
  back.resize(800, 610);
  mid = loadImage("grass.png");
  mid.resize(800, 608);
  fore = loadImage("grass.png");
  fore.resize(800, 610);
}

void draw(){
  image(back, 0, by); image(back, 0, by2);
  image(mid, 0, my); image(back,0, my2);
  image(fore,0, fy); image(fore, 0, fy2);
  if (genRoad){
    image(road, 0, roady);
    if (roady >600) {
      genRoad = false;
      roady = -300;
    }
  }
  if (by <-600) {by = 600;} if (by2 <-600) {by2 = 600;}
  if (my <-600) {by = 600;} if (by2 <-600) {by2 = 600;}
  if (fy <-600) {fy = 600;} if (fy2 <-600) {fy2 = 600;}
  if (by > 600) {by = -600;} if (by2 > 600) {by2 = -600;}
  if (my >600) {by = -600;} if (by2 >600) {by2 = -600;}
  if (fy >600) {fy = -600;} if (fy2 >600) {fy2 = -600;}
  generateRoads();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      by--; by2--;
      my-=2; my2-=2;
      fy-=3; fy2-=3;
      roady-=3;
      counter --;
      generateRoads();
      
      
    }
    if (keyCode == UP) {
      by++; by2++;
      my+=2; my2+=2;
      fy+=3; fy2+=3;
      roady+= 3;
      counter ++;
      System.out.println(counter);
      generateRoads();
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
