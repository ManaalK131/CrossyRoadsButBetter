PImage player;
int x = 400;
int y = 300;

void setup(){
 size(800, 600); 
 player = loadImage("adorable.png");
}

void draw(){
 background(255);
 image(player, x, y);
 player.resize(0, 50);
 move();
}

void move(){
 if(keyPressed){
   if(key == CODED){
     if(keyCode==UP){
       y -= 1;
       }
       else if(keyCode==DOWN){
         y += 1;
       }
       else if(keyCode==LEFT){
         x -= 1;
       }
       else if(keyCode ==RIGHT){
         x += 1;
       }
}
 }
}
