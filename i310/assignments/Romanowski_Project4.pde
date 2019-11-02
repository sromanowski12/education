// Seth Romanowski
// INFO-I 310
// 10/25/19

// Project #4
// Idiom: Costs an arm & a leg...

// Global Objects
Bill cash =  new Bill();                          // Declare Bill object
Ball baseball = new Ball();                       // Declare Ball object
App exe = new App();                              // Declare App object

void setup(){
  size(728,520);
  frameRate(7);
}

void draw(){
  exe.display();                                  // Call App function to display everything on screen
}

// Class to define & display the application
class App {
  PImage reg;                                     // Declare image variable for cash register image
  float w=728, h=520;                             // Height and width variables
  
  // Inline Functions
  void loadReg(){ reg = loadImage("Cash-Register.png"); }   // Assign cash register image
  void drawReg(){ image(reg,0,0); }                         // Display cash register image
  
  // Function to display everything in the program
  void display(){
    exe.loadReg();                                // Call function to assign cash register image
    baseball.loadImg();                           // Call function to assign baseball image
    cash.loadImg();                               // Call function to assign dollar bill images
    exe.drawReg();                                // Call function to display cash register image
    baseball.drawBall();                          // Call function to display baseball image
    cash.drawBills();                             // Call function to display dollar bill images
  }
}

// Class to define & display the baseball image
class Ball {
  PImage img;                                     // Declare image variable for baseball image
  int imgX=700, imgY=400;                         // X & Y variables for baseball image
  
  // Inline Functions
  void loadImg(){ img = loadImage("baseball.png"); } // Assign baseball image
  
  // Function to display the baseball image
  void drawBall(){ 
    if(cash.imgY[0] > height+50 && cash.imgY[1] > height+50 && cash.imgY[2] > height+50 && cash.imgY[3] > height+50 &&
       cash.imgY[4] > height+50 && cash.imgY[5] > height+50 && cash.imgY[6] > height+50 && cash.imgY[7] > height+50){
      frameRate(25);
      image(img, imgX-=.6,imgY); 
    }
  }
}

// Class to define & display the "arm & leg" dollar bills
class Bill {
  PImage[] img = new PImage[8];                            // Declare image array for dollar bill images
  float[] imgX = { 250, 350, 125, 175, 62, 87, 31, 44 };   // Declare array for X variables of dollar bill images
  float[] imgY = { 200, 225, 100, 112, 50, 55, 25, 27 };   // Declare array for Y variables of dollar bill images
  
  // Function to assign dollar bills
  void loadImg(){
    img[0] = loadImage("100-dollar-bill-w-arm.png");
    img[1] = loadImage("100-dollar-bill-w-leg.png");
    img[2] = loadImage("100-dollar-bill-w-arm.png");
    img[3] = loadImage("100-dollar-bill-w-leg.png");
    img[4] = loadImage("100-dollar-bill-w-arm.png");
    img[5] = loadImage("100-dollar-bill-w-leg.png");
    img[6] = loadImage("100-dollar-bill-w-arm.png");
    img[7] = loadImage("100-dollar-bill-w-leg.png");
  }

  // Function to display dollar bills
  void drawBills(){
    rotate(-0.2); 
    image(img[0], imgX[0]=imgX[0]-5,imgY[0]=imgY[0]+5);
    rotate(-0.2); 
    image(img[1], imgX[1]=imgX[1]-5,imgY[1]=imgY[1]+5);
    rotate(-0.2); 
    image(img[2], imgX[2]=imgX[2]-5,imgY[2]=imgY[2]+5);
    rotate(-0.2); 
    image(img[3], imgX[3]=imgX[3]-5,imgY[3]=imgY[3]+5);
    rotate(-0.2); 
    image(img[4], imgX[4]=imgX[4]-5,imgY[4]=imgY[4]+5);
    rotate(-0.2); 
    image(img[5], imgX[5]=imgX[5]-5,imgY[5]=imgY[5]+5);
    rotate(-0.2); 
    image(img[6], imgX[6]=imgX[6]-5,imgY[6]=imgY[6]+5);
    rotate(-0.2);
    image(img[7], imgX[7]=imgX[7]-5,imgY[7]=imgY[7]+5);
    rotate(0);
  }
}