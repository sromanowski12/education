// Seth Romanowski
// I310
// 9/20/19

// Project #2:
// Create a brand new design, write it with variables instead of hard-coded values. 
// Use a for loop in the creation of your design. You must also select and implement a brand new color harmony.
// Write a series of assignment operations that alter the values of those variables and make the design dynamic.
// You might also use system variables, such as width, height, mouseX, and mouseY.
// Using conditional statements, alter the behavior of your design based on certain conditions decided by you. 
// For example: What happens if it touches the edge of the screen, or if it grows to a certain size? 
// What happens if you move the mouse over elements in your design?
// Start from scratch and focus on pattern design plus animation behaviors that use variables, conditionals, and loops. 

// Initialize Ball & Block Objects
Ball b1 = new Ball(3.2, 2.2, 1, 1); 

Block blk1 = new Block();
Block blk2 = new Block();
Block blk3 = new Block();
Block blk4 = new Block();
Block blk5 = new Block();
Block blk6 = new Block();

float paddleX, paddleY = 400, paddleWidth, paddleHeight, paddleColor = 0;
float baseX, baseY, baseWidth, baseHeight, baseColor = 255;

void setup(){
  size(400, 500);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  // Starting position of the ball
  b1.xpos = width/2;
  b1.ypos = height/2;
}

void draw(){
  paddleX = mouseX;
  
  background(0,255,100);
  
  // Update the position of the ball
  b1.xpos = b1.xpos + ( b1.xspeed * b1.xdir );
  b1.ypos = b1.ypos + ( b1.yspeed * b1.ydir );
  
  // Hide blocks if they have been hit by the ball
  if(b1.xpos >= 100 && b1.xpos <= 160 && b1.ypos >= 100 && b1.ypos <= 120 && blk1.hit == false){
    blk1.hideBlock(100, 100, 60, 20);
    blk1.hit = true;
    b1.xdir *= -1;
    b1.ydir *= -1;
  }
  else if(b1.xpos >= 170 && b1.xpos <= 230 && b1.ypos >= 100 && b1.ypos <= 120 && blk2.hit == false){
    blk2.hideBlock(170, 100, 60, 20);
    blk2.hit = true;
    b1.xdir *= -1;
    b1.ydir *= -1;
  }
  else if(b1.xpos >= 240 && b1.xpos <= 300 && b1.ypos >= 100 && b1.ypos <= 120 && blk3.hit == false){
    blk3.hideBlock(240, 100, 60, 20);
    blk3.hit = true;
    b1.xdir *= -1;
    b1.ydir *= -1;
  }
  else if(b1.xpos >= 120 && b1.xpos <= 180 && b1.ypos >= 140 && b1.ypos <= 160 && blk4.hit == false){
    blk4.hideBlock(100, 100, 60, 20);
    blk4.hit = true;
    b1.xdir *= -1;
    b1.ydir *= -1;
  }
  else if(b1.xpos >= 190 && b1.xpos <= 250 && b1.ypos >= 140 && b1.ypos <= 160 && blk5.hit == false){
    blk5.hideBlock(170, 100, 60, 20);
    blk5.hit = true;
    b1.xdir *= -1;
    b1.ydir *= -1;
  }
  else if(b1.xpos >= 160 && b1.xpos <= 220 && b1.ypos >= 180 && b1.ypos <= 200 && blk6.hit == false){
    blk6.hideBlock(240, 100, 60, 20);
    blk6.hit = true;
    b1.xdir *= -1;
    b1.ydir *= -1;
  }
  // Test to see if the ball exceeds the screen height or width
  // If it does, reverse its direction
  else if (b1.xpos > width-b1.radius || b1.xpos < b1.radius) {
    b1.xdir *= -1;
    paddleColor = 0;
  }
  
  if (b1.ypos > height-100-b1.radius || b1.ypos < b1.radius) {
    b1.ydir *= -1;
    paddleColor = 200;
  }
  
  // If all blocks have been hit, hide the ball
  if(blk1.hit == true && blk2.hit == true && blk3.hit == true && blk4.hit == true && blk5.hit == true && blk6.hit == true)
  {
    b1.hideBall();
    b1.xdir = 0;
    b1.ydir = 0;
  }
  else{
    // Draw the ball
    b1.drawBall();
  }
  
  // Draw the paddle
  drawPaddle();
  
  // Draw the base - top
  drawTop();
  
  // Draw the lives remaining
  drawLives();
  
  // Draw the base - bottom
  drawBottom();
  
  // Draw the blocks - 3 rows / 6 blocks
  for(int i = 0; i < 3; i++){
    if(i == 0){                        // 1st row of blocks
      for(int j = 0; j < 3; j++){
        if(j == 0 && blk1.hit == false){
          blk1.drawBlock(100, 100, 60, 20);
        }
        else if(j == 1 && blk2.hit == false){
          blk2.drawBlock(170, 100, 60, 20);
        }
        else if(j == 2 && blk3.hit == false){
          blk3.drawBlock(240, 100, 60, 20);
        }
      }
    }
    else if(i == 1){                  // 2nd row of blocks
      for(int j = 0; j < 2; j++){
        if(j == 0 && blk4.hit == false){
          blk4.drawBlock(120, 140, 60, 20);
        }
        else if(j == 1 && blk5.hit == false){
          blk5.drawBlock(190,140,60,20);
        }
      }
    }
    else if(i == 2 && blk6.hit == false){                  // 3rd row of blocks
      blk6.drawBlock(160, 180, 60, 20);
    }
  }
  
}

void drawPaddle(){
   // Draw the paddle
  fill(paddleColor);
  rect(paddleX, paddleY, 100, 20);
}

void drawTop(){
  // Draw the base - top
  fill(0);
  rect(0, 0, 500, 20);
}

void drawBottom(){
  fill(0);
  rect(0, 480, 500, 20);
}

void drawLives(){
  // Draw the lives remaining
  fill(200, 200, 200);
  ellipse(10, 10, 5, 5);
  fill(200, 200, 200);
  ellipse(30, 10, 5, 5);
  fill(200, 200, 200);
  ellipse(50, 10, 5, 5);
}

class Ball { 
  float xpos, ypos, xspeed, yspeed;
  int xdir, ydir;
  float radius = 15;
  
  Ball (float xs, float ys, int xd, int yd) {  
    xspeed = xs;
    yspeed = ys; 
    xdir = xd;
    ydir = yd;
  } 
  
  void drawBall() {
    fill(0);
    ellipse(xpos, ypos, radius, radius);
  }
 
  void hideBall() {
    fill(0, 255, 100);
  }
  
  void changeColor(float r, float g, float b, float t){
    fill(r, g, b, t);
  }
} 

class Block {
 float blkcolor = 200, blkheight, blkwidth, xpos, ypos;
 boolean hit;
 
 Block(){
   
 }
 
 Block(float x, float y, float h, float w){
   xpos = x;
   ypos = y;
   blkheight = h;
   blkwidth = w;
  
 }
 void drawBlock(float x, float y, float h, float w){
   fill(blkcolor, blkcolor, blkcolor);
   rect(x, y, h, w);
 }
 
 void hideBlock(float x, float y, float h, float w){
  fill(0, 255, 100);
  rect(x, y, h, w);
 }
 void changeColor(float r, float g, float b, float t){
   fill(r, g, b, t);
 
 }
  
}