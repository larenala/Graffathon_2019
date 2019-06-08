import moonlander.library.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Moonlander moonlander;

int rad = 60;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom


void setup() 
{
  moonlander = Moonlander.initWithSoundtrack(this, "Sokolovsky_Leo_Funk.mp3", 110, 8);
  size(640, 360);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
  moonlander.start();
}

void drawScene0() {
  xpos = (float) moonlander.getValue("xpos");
  ypos = (float) moonlander.getValue("ypos");
  
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  // Draw the shape
  ellipse(xpos, ypos, rad, rad);
}

void drawScene1() {
  background(0);
  
  float time = (float) moonlander.getCurrentTime();
  float beats = time * (110.0 / 60.0);
  int beat = int(beats);
  int counter = 0;
  for(int i=0;i<=20;i++){
    //looks good, but 10->20 error :D
   float x = map(i, 0, 10, -640, 320);
     ellipse(x,0, 60, 60);
     counter++;
     if(counter > beat){
       return;
     }
  }  
}

void draw() 
{
  background(102);
  moonlander.update();
  float time = (float) moonlander.getCurrentTime();
  translate(width/2, height/2);
  scale(height/1000.0);
  
  // Update the position of the shape
  //xpos = xpos + ( xspeed * xdirection );
  //ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  
  
  int scene = moonlander.getIntValue("scene");
  
 if (scene == 0){
    drawScene0();
 } else if(scene == 1){
    drawScene1();
  } else if(scene > 5){
    exit();
  }else{
   println("Unknown scene number: "+scene); 
  }
  
  println("FPS:"+frameRate+" , time:"+time);
}
  
  
