
public class player{
protected PImage player;
protected int x = 400;
protected int y = 300;



void move(){
 if(keyPressed){
   if(key == CODED){
     //if(keyCode==UP){
       //y -= 1;
       //}
       //else if(keyCode==DOWN){
         //y += 1;
       //}
        if(keyCode==LEFT){
         x -= 3;
       }
       else if(keyCode ==RIGHT){
         x += 3;
       }
}
 }
}

}
