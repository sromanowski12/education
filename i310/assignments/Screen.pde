// Screen class
// Screen.pde

//          Screen Numbers
// -----------------------------------------
// 1. Main Menu    | 2. Main Menu (Dark)
// 3. Smart Lights | 4. Smart Lights (Dark)
// 5. Audio Player | 6. Audio Player (Dark)

class Screen {
 int s_x, s_y;
 int s_w=1080;
 int s_h=600;
 
 int bg_color;
 int number; 
 
 boolean isDark = true;

 Button app_btn = new Button();

 Button sl_btn = new Button(); // Smart Lights Button
 Button al_btn = new Button(); // Audio Library Button
 Button ei_btn = new Button(); // Email Inbox Button
 Button vl_btn = new Button(); // Video Library Button
 Button ti_btn = new Button(); // Text Messaging Button
 Button am_btn = new Button(); // Settings Button

 Button gh_btn = new Button();
 
 Button kr_btn = new Button();
 Button play = new Button();
 Button pause = new Button();


void setScreenNumber(int num){ number=num; }
int getScreenNumber(){ return number; }

void setBackgroundColor(int clr){
   bg_color = clr;
//   tint(255, 200);
   background(bg_color);
}

// Clear Screens
// Home Screen
void clearHomeScreen(){ background(255); }
// Home Screen Dark
void clearHomeScreenDark()
{ 
  // background(0); 
  sl_btn.hideSmartLights(80,20,300,215);
  al_btn.hideAudioLibrary(390,20,300,215);
  ei_btn.hideEmail(700,20,300,215);
  vl_btn.hideVideoLibrary(80,245,300,215);
  ti_btn.hideTextMsg(390,245,300,215);
  am_btn.hideSettings(700,245,300,215);
}
// Smart Lights Screen
void clearSmartLightsScreen()
{ 
  sl_btn.hideRooms();
  setBackgroundColor(255);
  displayMainMenuButtons();
}
// Smart Lights Screen Dark
void clearSmartLightsScreenDark()
{ 
  sl_btn.hideRooms();
  setBackgroundColor(40);
  displayMainMenuButtons();
}


 // Display Screens
 // Home Screen
 void displayHome(){
     isDark = false;
     setScreenNumber(1);
     displayMainMenuButtons();
 }
 // Home Screen Dark
 void displayHomeDark(){
    isDark = true;
    setScreenNumber(2);
    setBackgroundColor(40);
    displayMainMenuButtons();
 }
// Smart Lights Screen
void displaySmartLights(){
    isDark = false;
    setScreenNumber(3);
    displaySmartLightsButtons();
}
// Smart Lights Screen Dark
void displaySmartLightsDark(){
    isDark = true;
    setScreenNumber(4);
    setBackgroundColor(40);
    displaySmartLightsButtons();
}
// Audio Library
void displayAudioLibrary(){
    isDark = false;
    setScreenNumber(5);
    displayAudioLibraryButtons();
    gh_btn.displayHomeButton();
}
// Audio Library Dark
void displayAudioLibraryDark(){
    isDark = true;
    setScreenNumber(6);
    setBackgroundColor(40);
 //   displayAudioLibraryButtons();
    displayAudioLibraryButtons();
    gh_btn.displayHomeButton();
}

// Email Inbox
void displayEmailInbox(){
    stroke(255);
    fill(255);
    rect(220,100,780,480);
    ei_btn.emailfileicon = loadImage("open-email2.png");

    image(ei_btn.emailfileicon, 240, 140);
    image(ei_btn.emailfileicon, 240, 220);
    image(ei_btn.emailfileicon, 240, 300);
    image(ei_btn.emailfileicon, 240, 380);
    image(ei_btn.emailfileicon, 240, 460);

    stroke(0);
    line(480,100,480,1080);
    line(480,180,1080,180);

    gh_btn.displayHomeButton();
}


// Display Screen Buttons
// Home Screen Buttons
void displayMainMenuButtons(){
   sl_btn.displaySmartLights();
   al_btn.displayAudioLibrary();
   ei_btn.displayEmail();
   vl_btn.displayVideoLibrary();
   ti_btn.displayTextMsg();
   am_btn.displaySettings();
 }

 void displayMainMenuButtonsDark(){
   
   sl_btn.displaySmartLights();
   al_btn.displayAudioLibrary();
   ei_btn.displayEmail();
   vl_btn.displayVideoLibrary();
   ti_btn.displayTextMsg();
   am_btn.displaySettings();
 }
 // Smart Lights Screen Buttons
 void displaySmartLightsButtons(){
  sl_btn.displayRooms();
  gh_btn.displayHomeButton();
 }

 void displayAudioLibraryButtons(){
     al_btn.displayAudioLibraryGrid();
 }

 void displayEmailButtons(){
     ei_btn.displayEmail();
 }

 void displayVideoLibraryButtons(){
    pause.displayPause();
 }

 void displayTextButtons(){

 }

 void displaySettingsButtons(){

 }
}