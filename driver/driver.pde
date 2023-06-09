import java.lang.Math;

Terrain terr;
player pl;
protected PImage endscreen;
protected int lost = 0;

void setup(){
  terr = new Terrain();
  pl = new player();
  size(800, 600);
  terr.carArray[0] = loadImage("redCar.png");
  terr.carArray[0].resize(80, 50);
  terr.carArray[1] = loadImage("greenCar.png");
  terr.carArray[2] = loadImage("blueCar.png");
  terr.carArray[3] = loadImage("police.png");
  terr.carArray[1].resize(80, 80);
  terr.carArray[2].resize(80, 80);
  terr.carArray[3].resize(80, 50);
  terr.back = loadImage("magic.png");
  terr.back.resize(800, 610);
  terr.mid = loadImage("magic.png");
  terr.mid.resize(800, 608);
  terr.fore = loadImage("magic.png");
  terr.fore.resize(800, 610);
  size(800, 600); 
  pl.player = loadImage("adorable.png");
  endscreen = loadImage("gameover.png");
  endscreen.resize(1000, 800);
}

void draw(){
  image(terr.back, 0, terr.by); image(terr.back, 0, terr.by2);
  image(terr.mid, 0, terr.my); image(terr.back,0, terr.my2);
  image(terr.fore,0, terr.fy); image(terr.fore, 0, terr.fy2);
  if (terr.genBigRoad){
    image(terr.bigRoad, 0, terr.bRoady);
    terr.genCarsBig();
    if (terr.bRoady >800) {
      terr.genBigRoad = false;
      terr.bRoady = -100;
    }
  }
  if (terr.genRoad){
    image(terr.road, 0, terr.roady);
    terr.genCars();
    if (terr.roady >600) {
      terr.genRoad = false;
      terr.roady = -300;
    }
  }
  if (terr.by <-600) {terr.by = 600;} if (terr.by2 <-600) {terr.by2 = 600;}
  if (terr.my <-600) {terr.by = 600;} if (terr.by2 <-600) {terr.by2 = 600;}
  if (terr.fy <-600) {terr.fy = 600;} if (terr.fy2 <-600) {terr.fy2 = 600;}
  if (terr.by > 600) {terr.by = -600;} if (terr.by2 > 600) {terr.by2 = -600;}
  if (terr.my >600) {terr.by = -600;} if (terr.by2 >600) {terr.by2 = -600;}
  if (terr.fy >600) {terr.fy = -600;} if (terr.fy2 >600) {terr.fy2 = -600;}
  terr.generateRoads();
  terr.generateBigRoad();
 image(pl.player, pl.x, pl.y);
 pl.player.resize(0, 50);
 pl.move();
 terr.move();
 if (collision()==true){
   lost++;
   pl.player = loadImage("oof.png");
 }
 while(lost > 0){
   image(endscreen, 60, 0);
 }
}

boolean collision(){
  if (((Math.abs(terr.vr - pl.x)) < 1) || 
  ((Math.abs(terr.vg - pl.x)) < 1) || 
  ((Math.abs(terr.vp - pl.x)) < 1) || 
  ((Math.abs(terr.vb - pl.x)) < 2) || 
  ((Math.abs(terr.vbr - pl.x)) < 2) || 
  ((Math.abs(terr.vbg - pl.x)) < 2) || 
  ((Math.abs(terr.vbp - pl.x)) < 2) || 
  ((Math.abs(terr.vbb - pl.x)) < 2)){
    //OH CHECK THE Y VALUES AS WELL
   return true; 
  }
  else{
    return false;
  }
}
