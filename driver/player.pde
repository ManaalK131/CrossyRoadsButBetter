public class player{
protected PImage player;
protected int x = 400;
protected int y = 300;
protected int disy = 600;
protected int disby = 110;


void move(){
 if(keyPressed){
   if(key == CODED){
     if(keyCode==UP){
       disy -= 2;
       disby -= 2;
     }
     else if(keyCode==DOWN){
       disy += 2;
       disby += 2;
     }
        if(keyCode==LEFT){
         x -= 2;
       }
       else if(keyCode ==RIGHT){
         x += 2;
       }
}
 }
}

}
