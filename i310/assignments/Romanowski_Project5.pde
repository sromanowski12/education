// Seth Romanowski
// I310
// 11/8/19
// Project 5

import processing.sound.*; 

// Sound Objects
SoundFile moo;     // A Sample object (for a sound)
SoundFile moo2; 

PFont f; //a variable to hold a single style of type, a font.

// Cartoon Animal Image Objects
PImage chick;
PImage chick-flip;
PImage cow;
PImage cow-flip;
PImage horse;
PImage horse-flip;

// On and Off Switch Image Objects
PImage imgSw30, imgSw31;

int rectX, rectY;       // Position of button 1
int rectX2, rectY2;     // Position of button 2
int rectX3, rectY3;     // Position of button 3
int rectX4, rectY4;     // Position of button 4
int rectX5, rectY5;     // Position of button 5
int rectX6, rectY6;     // Position of button 6
int rectX7, rectY7;     // Position of button 7
int rectX8, rectY8;     // Position of button 8
int rectX9, rectY9;     // Position of button 9

int rectSize = 50;   
int x;
int y;
color rectColor, baseColor;
color rectHighlight;
color currentColor;

boolean rectOver = false;
boolean rectOver2 = false;
boolean rectOver3 = false;
boolean rectOver4 = false;
boolean rectOver5 = false;
boolean rectOver6 = false;
boolean rectOver7 = false;
boolean rectOver8 = false;
boolean rectOver9 = false;

boolean playing = true;

boolean imgOver = false;
boolean imgOver2 = false;
boolean imgOver3 = false;
boolean imgOver4 = false;
boolean imgOver5 = false;
boolean imgOver6 = false;
boolean imgOver7 = false;
boolean imgOver8 = false;
boolean imgOver9 = false;

void setup(){
  size(1200,600);
//  moo = new SoundFile(this, "three.aiff"); // load the audio file into Processing
//  moo2 = new SoundFile(this, "deadDragon.mp3"); 
  rectHighlight = color(255);
  // 256 x 256
  chick = loadImage("chick-pic.png");
  chick-flip = loadImage("chick-pic-flip.png");
  cow = loadImage("cow-pic.png");
  cow-flip = loadImage("cow-pic-flip.png");
  horse = loadImage("funnyHorse2.png");
  horse-flip = loadImage("funnyHorse2-flip.png");
  // 132 x 80
  imgSw31 = loadImage("onSwitch.png");
  // 132 x 80
  imgSw30 = loadImage("offSwitch.png");
  
  rectX3 = 10;
  rectY3 = 256;
  rectX2 = 266;
  rectY2 = 256;
  rectX = 522;
  rectY = 256;
  
  f = createFont("Arial Black", 18); //loading the font variable w/ a single font file & its size.
  background(0);
}

void draw(){
//  background(0);
  
  image(chick,0,0);
  image(imgSw30,10,256);    // Button 1
  image(imgSw30,10,346);    // Button 4
  image(imgSw30,10,436);    // Button 7
  image(cow,256,0);
  image(imgSw30,266,256);   // Button 2
  image(imgSw30,266,346);   // Button 5
  image(imgSw30,266,436);   // Button 8
  image(horse,512,0);
  image(imgSw30,522,256);   // Button 3
  image(imgSw30,522,346);   // Button 6
  image(imgSw30,522,436);   // Button 9
  
  update(mouseX, mouseY);
  if (imgOver3 == true) {
    textFont(f, 32); //implementing the font & enlarging its size.
  //  fill(55, 22, 22);
    text ("Three", 780, 266);
   // image(imgSw31, 266, 256);
    image(imgSw31, 10, 256);
  }
  if (imgOver2 == true) {
    textFont(f, 32); //implementing the font & enlarging its size.
  //  fill(55, 22, 22);
    text ("Three", 780, 266);
   // image(imgSw31, 266, 256);
    image(imgSw31, 266, 256);
  }
  if (imgOver == true) {
    textFont(f, 32); //implementing the font & enlarging its size.
  //  fill(55, 22, 22);
    text ("Three", 780, 266);
   // image(imgSw31, 266, 256);
    image(imgSw31, 522, 256);
  }
}

void displayImg(){


}

void mousePressed() {
  if (rectOver == true) { //if the rectOver boolean is currently true && the mouse is pressed then:
   // wowza2.rate(1.1); //alters the play rate of the audio, must be a pos #
   // wowza2.play();  // play the audio
    if (imgOver == true) { 
      imgOver = false;
    } else {
      imgOver = true;
    }
  }
  if (rectOver2 == true) { //if the rectOver boolean is currently true && the mouse is pressed then:
   // wowza2.rate(1.1); //alters the play rate of the audio, must be a pos #
   // wowza2.play();  // play the audio
    if (imgOver2 == true) { 
      imgOver2 = false;
    } else {
      imgOver2 = true;
    }
  }
  if (rectOver3 == true) { //if the rectOver boolean is currently true && the mouse is pressed then:
   // wowza2.rate(1.1); //alters the play rate of the audio, must be a pos #
   // wowza2.play();  // play the audio
    if (imgOver3 == true) { 
      imgOver3 = false;
    } else {
      imgOver3 = true;
    }
  }
}

void update(int x, int y) { //implements the highlight over the 'imgSw31'
  if ( overRect(rectX, rectY, (rectSize + 33), rectSize) ) {
    rectOver = true;
  } else {
    rectOver = false;
  }
  if ( overRect(rectX2, rectY2, (rectSize + 33), rectSize) ) {
    rectOver2 = true;
  } else {
    rectOver2 = false;
  }
  if ( overRect(rectX3, rectY3, (rectSize + 33), rectSize) ) {
    rectOver3 = true;
  } else {
    rectOver3 = false;
  }
}

boolean overRect(int x, int y, int width, int height) { //measures the location of the mouse and compaires it to the location of the imgSw31.
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}