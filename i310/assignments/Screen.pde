// Screen class
// Screen.pde

//          Screen Numbers
// -----------------------------------------
// 1. Main Menu    | 2. Main Menu (Dark)
// 3. Smart Lights | 4. Smart Lights (Dark)
// 5. Audio Player | 6. Audio Player (Dark)

class Screen {
 int s_x, s_y;
 int s_width=1080;
 int s_height=600;
 
 int s_bg_color;
 int screen_num; 

 Button sl = new Button();
 
 void displayHome(){
  // setBackgroundColor(0);
 sl.displaySmartLightsButton();
 }
 
 void displayHomeDark(){
   setBackgroundColor(0);
 }
  
 void setBackgroundColor(int clr){
   s_bg_color = clr;
   background(s_bg_color);
 }
 
 void displayButtons(){
   
 }
 
 void displayHomeButton(){
     
 }
  
}