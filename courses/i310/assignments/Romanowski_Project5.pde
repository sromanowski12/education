// Seth Romanowski
// I310
// 11/8/19
// Project 5

import processing.sound.*; 

// Sound Objects
SoundFile moo;     
SoundFile chirp;
SoundFile hee; 

// Font Variable
PFont f;

// Cartoon Animal Image Variables
PImage chick;
PImage chick_flip;
PImage cow;
PImage cow_flip;
PImage horse;
PImage horse_flip;

// On and Off Switch Image Variables
PImage imgSw30, imgSw31;

int rectX, rectY;       // Position of button 3
int rectX2, rectY2;     // Position of button 2
int rectX3, rectY3;     // Position of button 1
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
  
  moo = new SoundFile(this, "cow.mp3");      // load the audio files into Processing
  hee = new SoundFile(this, "horse.mp3");    
  chirp = new SoundFile(this, "chicks.mp3");

  rectHighlight = color(255);
  // 256 x 256
  chick = loadImage("chick-pic.png");
  chick_flip = loadImage("chick-pic-flip.png");
  cow = loadImage("cow-pic.png");
  cow_flip = loadImage("cow-pic-flip.png");
  horse = loadImage("funnyHorse2.png");
  horse_flip = loadImage("funnyHorse2-flip.png");
  // 132 x 80
  imgSw31 = loadImage("onSwitch.png");
  imgSw30 = loadImage("offSwitch.png");
  
  rectX3 = 10;
  rectY3 = 256;
  rectX4 = 10;
  rectY4 = 346;
  rectX7 = 10;
  rectY7 = 436;

  rectX2 = 266;
  rectY2 = 256;
  rectX5 = 266;
  rectY5 = 346;
  rectX8 = 266;
  rectY8 = 436;

  rectX = 522;
  rectY = 256;
  rectX6 = 522;
  rectY6 = 346;
  rectX9 = 522;
  rectY9 = 436;
  
  f = createFont("Arial Black", 18);
  background(0);
}

void draw(){
  background(0);
  
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

  checkButtons();
}

void flipChick(){
  background(0);

  image(chick_flip,0,0);

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

  text ("Four", 780, 160);

}

void blueChick(){
  background(0);

  tint(0, 153, 204);        // Tint blue
  image(chick,0,0);
  noTint();

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

  text ("Seven", 780, 280);

}

void flipCow(){
  background(0);

  image(chick,0,0);

  image(imgSw30,10,256);    // Button 1
  image(imgSw30,10,346);    // Button 4
  image(imgSw30,10,436);    // Button 7

  image(cow_flip,256,0);

  image(imgSw30,266,256);   // Button 2
  image(imgSw30,266,346);   // Button 5
  image(imgSw30,266,436);   // Button 8

  image(horse,512,0);

  image(imgSw30,522,256);   // Button 3
  image(imgSw30,522,346);   // Button 6
  image(imgSw30,522,436);   // Button 9

  text ("Five", 780, 200);
  
}

void blueCow(){
  background(0);
  
  image(chick,0,0);

  image(imgSw30,10,256);    // Button 1
  image(imgSw30,10,346);    // Button 4
  image(imgSw30,10,436);    // Button 7
  
  tint(0, 153, 204);        // Tint blue
  image(cow,256,0);
  noTint();

  image(imgSw30,266,256);   // Button 2
  image(imgSw30,266,346);   // Button 5
  image(imgSw30,266,436);   // Button 8

  image(horse,512,0);

  image(imgSw30,522,256);   // Button 3
  image(imgSw30,522,346);   // Button 6
  image(imgSw30,522,436);   // Button 9

  text ("Eight", 780, 320);
}

void flipHorse(){
  background(0);

  image(chick,0,0);

  image(imgSw30,10,256);    // Button 1
  image(imgSw30,10,346);    // Button 4
  image(imgSw30,10,436);    // Button 7

  image(cow,256,0);

  image(imgSw30,266,256);   // Button 2
  image(imgSw30,266,346);   // Button 5
  image(imgSw30,266,436);   // Button 8

  image(horse_flip,512,0);

  image(imgSw30,522,256);   // Button 3
  image(imgSw30,522,346);   // Button 6
  image(imgSw30,522,436);   // Button 9

  text ("Six", 780, 240);
  
}

void blueHorse(){
  background(0);
  
  image(chick,0,0);

  image(imgSw30,10,256);    // Button 1
  image(imgSw30,10,346);    // Button 4
  image(imgSw30,10,436);    // Button 7
  
  image(cow,256,0);

  image(imgSw30,266,256);   // Button 2
  image(imgSw30,266,346);   // Button 5
  image(imgSw30,266,436);   // Button 8

  tint(0, 153, 204);        // Tint blue
  image(horse,512,0);
  noTint();

  image(imgSw30,522,256);   // Button 3
  image(imgSw30,522,346);   // Button 6
  image(imgSw30,522,436);   // Button 9

  text ("Nine", 780, 360);
}
void checkButtons(){
  if (imgOver3 == true) {
    textFont(f, 32);
    text ("One", 780, 40);
    image(imgSw31, 10, 256);
  }
  if (imgOver4 == true) {
    textFont(f, 32); 
    
    flipChick();
    image(imgSw31, 10, 346);
  }
  if (imgOver7 == true) {
    textFont(f, 32); 
  //  fill(55, 22, 22);
    
    blueChick();
    image(imgSw31, 10, 436);
  }
  if (imgOver2 == true) {
    textFont(f, 32); 
    text ("Two", 780, 80);
    image(imgSw31, 266, 256);
  }
  if (imgOver5 == true) {
    textFont(f, 32);
  //  fill(55, 22, 22);
    flipCow();
    image(imgSw31, 266, 346);
  }
  if (imgOver8 == true) {
    textFont(f, 32);
  //  fill(55, 22, 22);
    
    blueCow();
    image(imgSw31, 266, 436);
  }
  if (imgOver == true) {
    textFont(f, 32);
  //  fill(55, 22, 22);
    text ("Three", 780, 120);
    image(imgSw31, 522, 256);
  }
 if (imgOver6 == true) {
    textFont(f, 32);
  //  fill(55, 22, 22);
   flipHorse();
    image(imgSw31, 522, 346);
  }
 if (imgOver9 == true) {
    textFont(f, 32);
  //  fill(55, 22, 22);
    
    blueHorse();
    image(imgSw31, 522, 436);
  }
}

void mousePressed() {
  if (rectOver == true) { 
    hee.rate(1.1); 
    hee.play();  
    if (imgOver == true) { 
      imgOver = false;
    } else {
      imgOver = true;
    }
  }
  if (rectOver2 == true) { 
    moo.rate(1.1); 
    moo.play(); 
    if (imgOver2 == true) { 
      imgOver2 = false;
    } else {
      imgOver2 = true;
    }
  }
  if (rectOver3 == true) { 
    if (imgOver3 == true) { 
      imgOver3 = false;
    } else {
      imgOver3 = true;
    }
  }
  if (rectOver4 == true) { 
    if (imgOver4 == true) { 
      imgOver4 = false;
    } else {
      imgOver4 = true;
    }
  }
 if (rectOver5 == true) { 
    if (imgOver5 == true) { 
      imgOver5 = false;
    } else {
      imgOver5 = true;
    }
  }
 if (rectOver6 == true) { 
    if (imgOver6 == true) { 
      imgOver6 = false;
    } else {
      imgOver6 = true;
    }
  }
 if (rectOver7 == true) { 
    if (imgOver7 == true) { 
      imgOver7 = false;
    } else {
      imgOver7 = true;
    }
  }
 if (rectOver8 == true) { 
    if (imgOver8 == true) { 
      imgOver8 = false;
    } else {
      imgOver8 = true;
    }
  }
 if (rectOver9 == true) { 
    if (imgOver9 == true) { 
      imgOver9 = false;
    } else {
      imgOver9 = true;
    }
  }
}

void update(int x, int y) { 
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
  if ( overRect(rectX4, rectY4, (rectSize + 33), rectSize) ) {
    rectOver4 = true;
  } else {
    rectOver4 = false;
  }
  if ( overRect(rectX5, rectY5, (rectSize + 33), rectSize) ) {
    rectOver5 = true;
  } else {
    rectOver5 = false;
  }
  if ( overRect(rectX6, rectY6, (rectSize + 33), rectSize) ) {
    rectOver6 = true;
  } else {
    rectOver6 = false;
  }
  if ( overRect(rectX7, rectY7, (rectSize + 33), rectSize) ) {
    rectOver7 = true;
  } else {
    rectOver7 = false;
  }
  if ( overRect(rectX8, rectY8, (rectSize + 33), rectSize) ) {
    rectOver8 = true;
  } else {
    rectOver8 = false;
  }
  if ( overRect(rectX9, rectY9, (rectSize + 33), rectSize) ) {
    rectOver9 = true;
  } else {
    rectOver9 = false;
  }
}

boolean overRect(int x, int y, int width, int height) { 
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}