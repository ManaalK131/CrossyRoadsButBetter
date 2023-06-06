PImage back;
PImage road;
PImage car;
PImage bigRoad;
int vr = 720;
int vg = 1020;
int vp = 1320;
int vb = 1620;
int velocity = 3; 
int roady = 0;
int counter;
int by = 0, by2 = 600;
int type = 0; //int(random(0,4));
boolean genRoad = false;
boolean genBigRoad = false;
int curVel = 720;
int bRoady = 0;
PImage mid;
int my = 0, my2 = 600;
int backCounter;

PImage[] carArray = new PImage[4];


PImage fore;
int fy = 0, fy2 = 600;


void CarSetup(int type){  //int type){

  /*carArray[type+1/4].resize(80, 80);
  image(carArray[type+1/4], vg + 240, roady);
  vg -= velocity;
  
  
  
  */
 if (type == 0){
    carArray[0].resize(80, 50);


  }
  if (type == 1){
     carArray[1].resize(80, 80);


  }
  if (type == 2){
     carArray[2].resize(80, 80);

  }
  if (type == 3){
   carArray[3].resize(80, 50);

}
  
  
  
}




void genCars(){
  velocity = 3 + (counter / 400);
  System.out.println(counter);
  //CarSetup(type);
  image(carArray[type], vr, roady);
  vr-=velocity;
 // CarSetup(type+1%4);
  image(carArray[type+1%4], vg , roady+20);
  vg-=velocity;
 //  CarSetup(type+2%4);
  image(carArray[type+2%4], vp, roady-10);
  vp-=velocity;
//   CarSetup(type+3%4);
  image(carArray[type+3%4], vb, roady+30);
  vb-=velocity;
  
  
  if (vr < -300 ) {
    vr = 720;
    //image(carArray[type], vr, roady);
  }
  
  
 if (vg < -250 ){
    vg = 720;
  }
  
  
  
  if (vp < -200 ){
    vp = 720 + 600;
  }
  if (vb < -100 ){
    vb = 720 + 900;
  }
  
  
  
    
/*
  if (vr < 200){
    System.out.println(type);
  
    type = (type+1)% 4;
    
    CarSetup(type); 
  }
  */
}


void setup(){
  size(800, 600);
  carArray[0] = loadImage("redCar.png");
  carArray[0].resize(80, 50);
  carArray[1] = loadImage("greenCar.png");
  carArray[2] = loadImage("blueCar.png");
  carArray[3] = loadImage("police.png");
  carArray[1].resize(80, 80);
  carArray[2].resize(80, 80);
  carArray[3].resize(80, 50);
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
  
  if (genBigRoad){
    image(bigRoad, 0, roady + 150);
    //type = int(random(0,4));
  //  CarSetup(type);
   // genCars(); 
    if (roady >800) {
      genRoad = false;
      roady = 0;
    }
  }
  if (genRoad){
    image(road, 0, roady+10);
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
  generateBigRoad();
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
      bRoady-=3;
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
      bRoady+= 3;
      counter ++;
      backCounter = 0;
      generateRoads();
    }
  }
}

protected void generateBigRoad(){
  bigRoad = loadImage("bigRoad.png.jpg");
  bigRoad.resize(800, 160);
  
  int speedUp = counter / 100 ;
  if (counter % (50 - speedUp) == 0){ //what about winning a game? how should we do that?
         
    genBigRoad = true;
    
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
