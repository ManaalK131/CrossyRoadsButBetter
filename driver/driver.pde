

Terrain terr;
player pl;

void setup(){
  //terr = new Terrain();
  terr = new newGround();
  pl = new player();
  size(800, 600);
  //terr.back = loadImage("grass.png");
  //terr.back.resize(800, 610);
  //terr.mid = loadImage("grass.png");
  //terr.mid.resize(800, 608);
  //terr.fore = loadImage("grass.png");
  //terr.fore.resize(800, 610);
  // size(800, 600); 
  terr.newGround = loadImage("magic.png");
  pl.player = loadImage("adorable.png");
}

void draw(){
  image(terr.back, 0, terr.by); image(terr.back, 0, terr.by2);
  image(terr.mid, 0, terr.my); image(terr.back,0, terr.my2);
  image(terr.fore,0, terr.fy); image(terr.fore, 0, terr.fy2);
  if (terr.genRoad){
    image(terr.road, 0, terr.roady);
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
 image(pl.player, pl.x, pl.y);
 pl.player.resize(0, 50);
 pl.move();
 terr.move();
}
