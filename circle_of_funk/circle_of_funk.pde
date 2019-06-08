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
  textAlign(CENTER, CENTER);
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

void drawScene3 () {
  background(255);  
  xpos = (float) moonlander.getValue("xpos");
  ypos = (float) moonlander.getValue("ypos");
  textAlign(CENTER);
  text("F", xpos, ypos);
  text("U", xpos, ypos);
  text("N", xpos, ypos);
  text("K", xpos, ypos);
  translate(0, 0);
 fill(51);
}



void drawScene4 () {
    background(255);
  
  xpos = (float) moonlander.getValue("xpos");
  ypos = (float) moonlander.getValue("ypos");
  
  float time = (float) moonlander.getCurrentTime();
  float beats = time * (110.0 / 60.0);
  int beat = int(beats);
  float r = random(-width*2, width*2);
  float rr = random(-height*2, height*2);
  int counter = 0;
  float red;
  float green;
  float blue;

  for(int i=0;i<=20;i++){
    xpos = random(r);
    ypos = random (rr);
    ellipse(i+xpos, i+ypos, 20, 20);
    red = random(100, 255);
    green = random(100, 255);
    blue = random(100, 255);
    fill(red, green, blue);
    counter++;
    if(counter > beat){
      fill(255);
       return;
     }
  }   
}

void drawScene2() {
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
 textAlign(CENTER);
 text("FUNK", 0, 0);
 fill(51);
}

void drawScene6() {
 background(255);
  float time = (float) moonlander.getCurrentTime();
  float beats = time * (110.0 / 60.0);
  int beat = int(beats)-160;
  int counter = 0;
  for(int i=0;i<=30;i++){
   float x = map(i, 0, 1000, 0, width);
     ellipse(x, 0, 60, 60);
     counter++;
     if(counter > beat){
       return;
     }
  }
}

void drawScene7() {
  float time = (float) moonlander.getCurrentTime();
  float xpos = (float) moonlander.getValue("xpos");
  float ypos = (float) moonlander.getValue("ypos");
  float circHeight = (float) moonlander.getValue("circHeight");
    background(0);
    circle(xpos, ypos, circHeight);
    fill(255, 0, 150,255);

}

void drawScene8() {
  float xpos = (float) moonlander.getValue("xpos");
  float ypos = (float) moonlander.getValue("ypos");
  float circHeight = (float) moonlander.getValue("circHeight");
  background(255);
  circle(xpos, ypos, circHeight);
  fill(255, 0, 150,255);
}

void drawScene9() {
  background(0);
  float rectWidth = (float) moonlander.getIntValue("rectWidth");
  float rectHeight = (float) moonlander.getIntValue("rectHeight");
  rectMode(CENTER);
  float rotation = (float) moonlander.getIntValue("rotation");
  rotate(PI/rotation);
  rect(0,0,rectWidth,rectHeight);
  fill(255);
  
}
 

void drawLastScene() {
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

void draw() {
  background(102);
  moonlander.update();
  float time = (float) moonlander.getCurrentTime();
  translate(width/2, height/2);
  scale(height/1000.0);
  
  
  int scene = moonlander.getIntValue("scene");
  
 if (scene == 0) {
    drawScene0();
 } else if(scene == 1) {
    drawScene1();
  } else if(scene == 2) {
    drawScene2();
  } else if(scene == 3) {
    drawScene3();
  } else if (scene == 4) {
    drawScene4();  
  }else if(scene == 7) {
    drawScene7();
  } else if (scene == 8) {
    drawScene8();
} else if (scene == 9){
  drawScene9();
} else if (scene == 5) {
  drawLastScene();
} else if (scene == 6) {
  drawScene6();
} else if (scene > 10 ){
    exit();
}else{
 println("Unknown scene number: "+scene); 
}
}
  
  
