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
 int s_number; 

 Button sl_btn = new Button();
 Button al_btn = new Button();
 Button ei_btn = new Button();
 Button vl_btn = new Button();
 Button ti_btn = new Button();
 Button am_btn = new Button();

void setScreenNumber(int num){ s_number=num; }

void setBackgroundColor(int clr){
   s_bg_color = clr;
   background(s_bg_color);
}
  
 void displayHome(){
     setScreenNumber(1);
     displayMainMenuButtons();
 }
 
 void displayHomeDark(){
    setScreenNumber(2);
    setBackgroundColor(0);
    displayMainMenuButtons();
 }
  
void displaySmartLights(){
    
}

void displaySmartLightsDark(){
    
}

void displayAudioLibrary(){
    
}

void displayAudioLibraryDark(){
    
}
 void displayMainMenuButtons(){
   sl_btn.displaySmartLightsButton();
   al_btn.displayAudioLibraryButton();
   ei_btn.displayEmailButton();
   vl_btn.displayVideoLibraryButton();
   ti_btn.displayTextButton();
   am_btn.displaySettingsButton();
 }

 void displaySmartLightsButtons(){

 }

 void displayAudioLibraryButons(){

 }

 void displayEmailButtons(){

 }

 void displayVideoLibraryButtons(){

 }

 void displayTextButtons(){

 }

 void displaySettingsButtons(){

 }
 
  
}