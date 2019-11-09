// Seth Romanowski
// I310
// 10/4/19

// Project #3

// Initialize Building & Earth Objects
Building b1 = new Building(40, 200, 100, 200);
Building b2 = new Building(150, 100, 100, 300);
Building b3 = new Building(260, 150, 100, 250);
Building b4 = new Building(380, 175, 100, 225);

Earth e1 = new Earth();

void setup(){
  size(500,500);
  background(255);
  frameRate(7);
}

void draw(){
  update();

  // If mousePressed change day to night and make it snow
  if(e1.earthOver){
    e1.drawNight();
    e1.drawSnow();
    stroke(0);
  }
  else{
    // Otherwise display day and make it rain
    e1.drawDay();
    e1.drawRain();
  }
  
  // Draw the 4 buildings and their doors
  drawCity();
  
  // If mousePressed draw windows and turn lights off
  if(e1.earthOver){
    b1.drawWindows1(0,0,0,100);
    b2.drawWindows2(0,0,0,100);
    b3.drawWindows3(0,0,0,100);
    b4.drawWindows4(0,0,0,100);
  } else {
    // Otherwise draw windows with lights on
    b1.drawWindows1(255,255,0,100);
    b2.drawWindows2(255,255,0,100);
    b3.drawWindows3(255,255,0,100);
    b4.drawWindows4(255,255,0,100);
  }
}

// Function to change day to night, and back
void update() {
  if (mousePressed && e1.earthOver == false){
    e1.drawNight();
    e1.earthOver = true;
  }
  else if(mousePressed && e1.earthOver == true){
    e1.earthOver = false;
  }
}

// Function to draw the 4 buildings and their doors
void drawCity(){
   fill(210,210,210);
   b1.drawBuilding();
   b1.drawDoor(80, 385, 10, 15);
   b1.drawDoor(90, 385, 10, 15);
   b2.drawBuilding();
   b2.drawDoor(190, 385, 10, 15);
   b2.drawDoor(200, 385, 10, 15);
   b3.drawBuilding();
   b3.drawDoor(300, 385, 10, 15);
   b3.drawDoor(310, 385, 10, 15);
   b4.drawBuilding();
   b4.drawDoor(420, 385, 10, 15);
   b4.drawDoor(430, 385, 10, 15);
}

class Earth
{
  boolean earthOver = false;
  
  // Function to draw the green ground
  void drawGrnd(){
    fill(0,255,0);
    rect(0, 400, 500, 100, 25, 25, 0, 0);
  }
  
  // Function to draw the blue or black sky
  void drawSky(float r, float g, float b){
     background(r,g,b); 
  }
  
  // Function to make it rain
  void drawRain(){
    float rainX, rainY;
    
    rainX = random(1, 500);
    rainY = random(1, 300);
    
    line(rainX, rainY, rainX, rainY-5);
  }
  
  // Function to make it snow
  void drawSnow(){
    float snowX, snowY;
    
    snowX = random(1, 500);
    snowY = random(1, 300);
    
    stroke(255);
    line(snowX, snowY, snowX, snowY-5);
    
  }
  
  // Function to draw the yellow sun and it's rays
  void drawSun(){
    fill(255, 255, 0);
    ellipse(0,0,125,125);
    
    // Draw yellow sun rays
    stroke(255,255,0);
    line(45,15,80,20);
    line(50,25,70,35);
    line(42,42,62,62);
    line(35,50,50,70);
    line(25,55,40,90);
    
    // Change stroke back to black (0)
    stroke(0);
  }
  
  // Function to draw blue sky, green ground, and yellow sun
  void drawDay(){
    drawSky(102,178,255);
    drawGrnd();
    drawSun();
  }
  
  // Function to draw black sky and green ground
  void drawNight(){
    drawSky(0,0,0);
    drawGrnd();
  }
}

class Building
{
  int bldgX, bldgY, bldgH, bldgW;
  
  // Building constructor
  Building(int x, int y, int w, int h){
    bldgX = x;
    bldgY = y;
    bldgH = h;
    bldgW = w;
  }
  
  // Function to draw a building
  void drawBuilding(){
    rect(bldgX, bldgY, bldgW, bldgH);
  }
  
  // Function to draw windows for building 1
  void drawWindows1(float r, float g, float b, float t){
     fill(r,g,b,t);
     // Building 1 windows
     rect(45,220,25,25);
     rect(45,280,25,25);
     line(45,245,70,220);
     line(45,305,70,280);
     
     rect(110,220,25,25);
     rect(110,280,25,25);
     line(110,245,135,220);
     line(110,305,135,280);
  }
  
  // Function to draw windows for building 2
  void drawWindows2(float r, float g, float b, float t){
     fill(r,g,b,t);
     // Building 2 windows
     rect(155,120,25,25);
     rect(155,155,25,25);
     line(155,145,180,120);
     line(155,180,180,155);
     
     rect(220,120,25,25);
     rect(220,155,25,25);
     line(220,145,245,120);
     line(220,180,245,155);
  }
  
  // Function to draw windows for building 3
  void drawWindows3(float r, float g, float b, float t){
     fill(r,g,b,t);
     // Building 3 windows
     rect(265,175,25,25);
     rect(265,210,25,25);
     line(265,200,290,175);
     line(265,235,290,210);
     
     rect(330,175,25,25);
     rect(330,210,25,25);
     line(330,200,355,175);
     line(330,235,355,210);
  }
  
  // Function to draw windows for building 4
  void drawWindows4(float r, float g, float b, float t){
     fill(r,g,b,t);
     // Building 4 windows
     rect(385,190,25,25);
     rect(385,225,25,25);
     line(385,215,410,190);
     line(385,250,410,225);
     
     rect(450,190,25,25);
     rect(450,225,25,25);
     line(450,215,475,190);
     line(450,250,475,225);
  }
  
  // Function to draw the building's door
  void drawDoor(float x, float y, float w, float h){
     rect(x, y, w, h);

  }
}