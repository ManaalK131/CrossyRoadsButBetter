PImage back;
int by = 0, by2 = 600;


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
  if (by <-600) {by = 600;} if (by2 <-600) {by2 = 600;}
  if (my <-600) {by = 600;} if (by2 <-600) {by2 = 600;}
  if (fy <-600) {fy = 600;} if (fy2 <-600) {fy2 = 600;}
  if (by > 600) {by = -600;} if (by2 > 600) {by2 = -600;}
  if (my >600) {by = -600;} if (by2 >600) {by2 = -600;}
  if (fy >600) {fy = -600;} if (fy2 >600) {fy2 = -600;}
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      by--; by2--;
      my-=2; my2-=2;
      fy-=3; fy2-=3;
      
    }
    if (keyCode == UP) {
      by++; by2++;
      my+=2; my2+=2;
      fy+=3; fy2+=3;
      
    }
  }
}
