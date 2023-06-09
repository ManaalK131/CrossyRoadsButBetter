PImage back;
PImage road;
PImage car;
PImage bigRoad;
int vr = 720;
int vg = 1020;
int vp = 1320;
int vb = 1620;
int vbr = 720;
int vbg = 1020;
int vbp = 1320;
int vbb = 1620;
int velocity = 2;
int roady = 0;
int counter;
int by = 0, by2 = 600;
int type =  int(random(0,4));
boolean genRoad = false;
boolean genBigRoad = false;
int curVel = 720;
PImage end;
PImage mid;
int my = 0, my2 = 600;
int backCounter;
int yCoor; 
PImage[] carArray = new PImage[4];

int bRoady = roady + 150;
PImage fore;
int fy = 0, fy2 = 600;


Buttons mode1; 
Buttons mode2;
boolean walkingDead = false;
boolean normal = false; 
boolean gameState = false;
PImage start;


void CarSetup(int type, int yCoor){ 
 if (type == 0){
    carArray[0].resize(80, 50);
    image(carArray[0], vr, yCoor);
  }
  if (type == 1){
     carArray[1].resize(80, 80);
     image(carArray[1], vg , yCoor+20);

  }
  if (type == 2){
     carArray[2].resize(80, 80);
     image(carArray[2], vp, yCoor-10);

  }
  if (type == 3){
   carArray[3].resize(80, 50);
   image(carArray[3], vb, yCoor+30);

}
}
  
  
void CarSetupBig(int type, int yCoor){ 
 if (type == 0){
    carArray[0].resize(80, 50);
    image(carArray[0], vbr, yCoor);
  }
  if (type == 1){
     carArray[1].resize(80, 80);
     image(carArray[1], vbg , yCoor+20);

  }
  if (type == 2){
     carArray[2].resize(80, 80);
     image(carArray[2], vbp, yCoor-10);

  }
  if (type == 3){
   carArray[3].resize(80, 50);
   image(carArray[3], vbb, yCoor+30);

}
}


void genCarsBig(){
    int v = 3 + (counter / 350); 
    
    CarSetupBig(0, bRoady -5);
    vbr-=v;
    
    CarSetupBig(1, bRoady +75);
    vbg-=v;
    
    CarSetupBig(3, bRoady -5);
    vbp-=v;
    CarSetupBig(2, bRoady +75);
    vbb-=v;
    
 
    if (vbr < -300 ) {
      vbr = 720;
    }
   
    if (vbg < -250 ){
      vbg = 720;
    }
      
    if (vbp < -200 ){
      vbp = 720 + 600;
    }
    
    if (vbb < -100 ){
      vbb = 720 + 900;
    }
    

    
  }

void genCars(){
  
    velocity = 2+ (counter / 400);
    CarSetup(type, roady);

    vr-=velocity;
    CarSetup((type+1)%4, roady);
    
    vg-=velocity;
     CarSetup((type+2) %4, roady);
    
    vp-=velocity;
     CarSetup((type+3) %4, roady);
    
    vb-=velocity;
    
    
    if (vr < -300 ) {
      vr = 720;
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
    
  }

  
void startScreen(){
  start = loadImage("start.png");
  start.resize(800, 600);
  background(start);
  mode1 = new Buttons(50, 100, 100, 50, "Normal", 0, 200, 200);
  mode2 = new Buttons(600, 100, 130, 60, "Walking Dead", 0, 200, 200);
  if (mode1.isClicked()  || mode2.isClicked()){
    gameState = true;
  }
  System.out.println(gameState);
}



void setup(){
  size(800, 600);
  if (gameState == false){
    startScreen();

  }
  else{
    if (mode1.isClicked()){
      carArray[0] = loadImage("redCar.png");
      carArray[0].resize(80, 50);
      carArray[1] = loadImage("greenCar.png");
      carArray[2] = loadImage("blueCar.png");
      carArray[3] = loadImage("police.png");
      carArray[1].resize(80, 80);
      carArray[2].resize(80, 80);
      carArray[3].resize(80, 50);
    }
    if (mode2.isClicked()){
      carArray[0] = loadImage("zombie0.png");
      carArray[1] = loadImage("zombie1.png");
      carArray[2] = loadImage("zombie2.png");
      carArray[3] = loadImage("car4.png");
   //   carArray[1].resize(80, 40);
    //  carArray[3].resize(80, 60);
    }
    end = loadImage("congrats.png");
    end.resize(800, 100);
    back = loadImage("grass.png");
    back.resize(800, 620);
    mid = loadImage("grass.png");
    mid.resize(800, 608);
    fore = loadImage("grass.png");
    fore.resize(800, 620);
  }
}

void draw(){
  startScreen();
  mode1.update();
  mode1.render();
  mode2.update();
  mode2.render();
  textAlign(CENTER);
  textSize(20);
  text("Pick mode and avatar", 400, 20);
  if (mode1.isClicked()  || mode2.isClicked()){
    gameState = true;
    setup();
  }
  System.out.println(gameState);
  if (gameState == true){
      
      image(back, 0, by); image(back, 0, by2);
      image(mid, 0, my); image(back,0, my2);
      image(fore,0, fy); image(fore, 0, fy2);
      if (genBigRoad){
        image(bigRoad, 0, bRoady);
        genCarsBig();
        if (bRoady >800) {
          genBigRoad = false;
          bRoady = -100;
        }
      }
      if (genRoad){
        image(road, 0, roady+10);
        genCars(); 
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
      generateBigRoad();
      if (counter == 2295){
        System.out.println("U won. My grandma's pround");
        
      }
      if (counter > 2295){
        image(end, 0, roady);
        System.out.println("Y are you still playing? Bad things will happen to the code if you continue");
        
      }
    }
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
  if (counter % (30- speedUp) == 0){ //what about winning a game? how should we do that?
         
    genBigRoad = true;
    
  } 
}
//RIGHT NOW IF YOU SURPASS 5000 STEPS YOU PRACTICALLY WIN SINCE OBSTACLES WON'T GENERATE ANYMORE
protected void generateRoads(){
  road = loadImage("shortRoad.png");
  road.resize(800, 80);
  
  int speedUp = counter / 100;
  if (counter % (30-speedUp) == 0){ //what about winning a game? how should we do that?
         
    genRoad = true;
    
  }  
  
}
