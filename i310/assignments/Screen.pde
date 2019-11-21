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
 
 boolean isDark = false;

 Button app_btn = new Button();

 Button sl_btn = new Button();
 Button al_btn = new Button();
 Button ei_btn = new Button();
 Button vl_btn = new Button();
 Button ti_btn = new Button();
 Button am_btn = new Button();
 
 Button kr_btn = new Button();
 Button play = new Button();
 Button pause = new Button();

 PImage floor;

void clearScreen()
{ 
  background(255);
  
}
void clearScreenDark()
{ 
  // background(0); 
  sl_btn.hideSmartLightsButton(80,20,300,215);
  al_btn.hideAudioLibraryButton(390,20,300,215);
  ei_btn.hideEmailButton(700,20,300,215);
  vl_btn.hideVideoLibraryButton(80,245,300,215);
  ti_btn.hideTextButton(390,245,300,215);
  am_btn.hideSettingsButton(700,245,300,215);

}


void setScreenNumber(int num){ s_number=num; }
int getScreenNumber(){ return s_number; }

void setBackgroundColor(int clr){
   s_bg_color = clr;
//   tint(255, 200);
   background(s_bg_color);
}
  
 void displayHome(){
     isDark = false;
     setScreenNumber(1);
     displayMainMenuButtons();
 }
 
 void displayHomeDark(){
    isDark = true;
    setScreenNumber(2);
    setBackgroundColor(40);
    displayMainMenuButtons();
 }
  
void displaySmartLights(){
    isDark = false;
    displaySmartLightsButtons();
}

void displaySmartLightsDark(){
    isDark = true;
    setScreenNumber(4);
    setBackgroundColor(40);
    displaySmartLightsButtons();
}

void displayAudioLibrary(){
    isDark = false;
}

void displayAudioLibraryDark(){
    isDark = true;
}

void displaySmartLightsButtons(){
  
  sl_btn.displayRoomsButton();
}

 void displayMainMenuButtons(){
   sl_btn.displaySmartLightsButton();
   al_btn.displayAudioLibraryButton();
   ei_btn.displayEmailButton();
   vl_btn.displayVideoLibraryButton();
   ti_btn.displayTextButton();
   am_btn.displaySettingsButton();
 }

 void displayAudioLibraryButons(){

 }

 void displayEmailButtons(){

 }

 void displayVideoLibraryButtons(){
    pause.displayPauseButton();
 }

 void displayTextButtons(){

 }

 void displaySettingsButtons(){

 }

 void displayFloorPlan(){


 }
 
  
}