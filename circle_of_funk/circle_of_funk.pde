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

PFont f;
float angle;
float offset = -100;

void setup() 
{
  moonlander = Moonlander.initWithSoundtrack(this, "Sokolovsky_Leo_Funk.mp3", 110, 8);
  size(640, 360);
  noStroke();
  frameRate(60);
  ellipseMode(RADIUS);
  printArray(PFont.list());
  f = createFont("BungeeShade-Regular.ttf", 224);
  textFont(f);
  // Set the starting position of the shape
  moonlander.start();
}

void drawScene0() {
  background(255);
  float xpos = (float) moonlander.getValue("xpos");
  float ypos = (float) moonlander.getValue("ypos"); 
  float circWidth = (float) moonlander.getIntValue("circWidth");
  float circHeight = (float) moonlander.getIntValue("circHeight");
  ellipse(xpos, ypos, circWidth,circHeight);
  fill(230, 100, 230, 30);
  ellipse(xpos-500, ypos, circWidth,circHeight);
  fill(230, 200, 130, 127);
  ellipse(xpos+500, ypos, circWidth,circHeight);
  fill(230, 100, 130, 30);
}

void drawScene1() {
  background(0);
  
  xpos = (float) moonlander.getValue("xpos");
  ypos = (float) moonlander.getValue("ypos");
  
  float time = (float) moonlander.getCurrentTime();
  float beats = time * (110.0 / 60.0);
  int beat = int(beats);
  float r = random(-width, width);
  float rr = random(-height, height);
  int counter = 0;
  float red;
  float green;
  float blue;

  for(int i=0;i<=20;i++){
    xpos = random(r);
    ypos = random (rr);
    ellipse(i+xpos, i+ypos, 20, 20);
    red = random(255);
    green = random(255);
    blue = random(255);
    fill(red, green, blue);
    counter++;
    if(counter > beat){
      fill(255);
       return;
     }
  }  
}


void write() {
  background(230, 100, 230);
  textAlign(CENTER);
 if (second() % 2 == 0) {  
   background(230, 200, 130);
    offset += 20;
  } 
  angle = angle + offset;
  float c = angle;
  translate(0, 0);
  rotate(c);
 text("FUNK", 0, 0);
 fill(51);
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
  } else if(scene == 2) {
    write();
  }else if (scene > 5){
    exit();
  }else{
   println("Unknown scene number: "+scene); 
  }
  
  println("FPS:"+frameRate+" , time:"+time);
}
  
  
