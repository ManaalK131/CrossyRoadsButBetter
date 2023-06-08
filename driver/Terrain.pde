public class Terrain{
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
protected int counter;
protected int by = 0, by2 = 600;
int type =  int(random(0,4));
boolean genRoad = false;
boolean genBigRoad = false;
int curVel = 720;

protected PImage mid;
protected int my = 0, my2 = 600;
int backCounter;
int yCoor; 
PImage[] carArray = new PImage[4];
int bRoady = roady + 150;
protected PImage fore;
protected int fy = 0, fy2 = 600;

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

  



void move() {
  if(keyPressed){
  if (key == CODED) {
    if (keyCode == DOWN) {
      by--; by2--;
      my--; my2--;
      fy--; fy2--;
      roady--;
      bRoady--;
      counter --;
      generateRoads();
      
      
    }
    if (keyCode == UP) {
      by++; by2++;
      my++; my2++;
      fy++; fy2++;
      roady++;
      bRoady++;
      counter ++;
      System.out.println(counter);
      generateRoads();
    }
  }
}
}


protected void generateBigRoad(){
  bigRoad = loadImage("bigRoad.png");
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
}
