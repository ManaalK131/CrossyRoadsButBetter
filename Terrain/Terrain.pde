PImage back;
PImage road;
PImage car;
int vr = 720;
int vg = 720;
int vp = 720;
int vb = 720;
int velocity = 3;
int roady = 0;
int counter;
int by = 0, by2 = 600;
int type = int(random(0,4));
boolean genRoad = false;
int curVel = 720;

PImage mid;
int my = 0, my2 = 600;
int backCounter;

PImage[] carArray = new PImage[4];


PImage fore;
int fy = 0, fy2 = 600;


void CarSetup(int type){
 if (type == 0){
    carArray[0].resize(80, 50);
    image(carArray[type], vr, roady);
    curVel = vr;
    vr-=velocity;
  }
  if (type == 1){
     carArray[1].resize(80, 80);
     image(carArray[type], vg, roady);
     curVel = vg;
     vg-=velocity;
  }
  if (type == 2){
     carArray[2].resize(80, 80);
     image(carArray[type], vb, roady);
     curVel = vb;
     vb-=velocity;
  }
  if (type == 3){
   carArray[3].resize(80, 50);
   image(carArray[type], vp, roady);
   curVel = vp;
   vp-=velocity;
}
  

  
  
}

void genCars(){
  if (curVel < 200){
    System.out.println(type);
    type = (type+1)% 4;
    
    CarSetup(type); 
  }
}


void setup(){
  size(800, 600);
  carArray[0] = loadImage("redCar.png");
  carArray[1] = loadImage("greenCar.png");
  carArray[2] = loadImage("blueCar.png");
  carArray[3] = loadImage("police.png");
  back = loadImage("grass.png");
  back.resize(800, 620);
  mid = loadImage("grass.png");
  mid.resize(800, 608);
  fore = loadImage("grass.png");
  fore.resize(800, 620);
}

void draw(){
  image(back, 0, by); image(back, 0, by2);
  image(mid, 0, my); image(back,0, my2);
  image(fore,0, fy); image(fore, 0, fy2);
 
  
  if (genRoad){
    image(road, 0, roady-10);
    //type = int(random(0,4));
    CarSetup(type);
    genCars(); 
    if (roady >600) {
      genRoad = false;
      roady = -300;
    }
  }
 // CarSetup();
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
      if (backCounter > 20){
      }
      else{
      by--; by2--;
      my-=2; my2-=2;
      fy-=3; fy2-=3;
      roady-=3;
      counter --;
      backCounter++;
      generateRoads();
      }
      
      
    }
    if (keyCode == UP) {
      by++; by2++;
      my+=2; my2+=2;
      fy+=3; fy2+=3;
      roady+= 3;
      counter ++;
      backCounter = 0;
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
