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

 Button btn = new Button();

// Main Menu Buttons
 Button sl_btn = new Button(); // Smart Lights Button
 Button al_btn = new Button(); // Audio Library Button
 Button ei_btn = new Button(); // Email Inbox Button
 Button vl_btn = new Button(); // Video Library Button
 Button ti_btn = new Button(); // Text Messaging Button
 Button am_btn = new Button(); // Settings Button

 // Navigation Buttons
 Button gh_btn = new Button(); // Go Home Button

 // Home Lights Buttons
 Button kr_btn = new Button(); // Kitchen Lights Button
 Button br_btn = new Button(); // Bathroom Lights Button
 Button bdr_btn = new Button(); // Bedroom Lights Button
 Button lr_btn = new Button();  // Living Roomo Lights Button
 Button hr_btn = new Button();  // Hallway Lights Button

 // Audio Library Buttons
 Button play = new Button();
 Button pause = new Button();

 Button play_btn1 = new Button();
 Button play_btn2 = new Button();
 Button play_btn3 = new Button();
 Button play_btn4 = new Button();

 // Settings Buttons
 Button switch_btn = new Button(); // Settings Switch Button


void setScreenNumber(int num){ number=num; }
int getScreenNumber(){ return number; }

void setBackgroundColor(int clr){
   bg_color = clr;
//   tint(255, 200);
   background(bg_color);
}

// Clear Screens
// Home Screen
void clearHomeScreen(){ 
    background(255);
    // sl_btn.hideSmartLights(80,100,300,215);
    // al_btn.hideAudioLibrary(390,100,300,215);
    // ei_btn.hideEmail(700,100,300,215);
    // vl_btn.hideVideoLibrary(80,325,300,215);
    // ti_btn.hideTextMsg(390,325,300,215);
    // am_btn.hideSettings(700,325,300,215); 
}
// Home Screen Dark
void clearHomeScreenDark()
{ 
  // background(0); 
  sl_btn.hideSmartLights(80,100,300,215);
  al_btn.hideAudioLibrary(390,100,300,215);
  ei_btn.hideEmail(700,100,300,215);
  vl_btn.hideVideoLibrary(80,325,300,215);
  ti_btn.hideTextMsg(390,325,300,215);
  am_btn.hideSettings(700,325,300,215);
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
    
    gh_btn.displayHomeButton();
}
// Audio Library Dark
void displayAudioLibraryDark(){
    isDark = true;
    setScreenNumber(6);
    setBackgroundColor(40);
 //   displayAudioLibraryButtons();
    al_btn.displayAudioLibraryGrid();
    // displayAudioLibraryButtons();
    gh_btn.displayHomeButton();
}

// Email Inbox
void displayEmailInbox(){
    stroke(255);
    fill(255);
    rect(220,100,780,480);
    ei_btn.emailfileicon = loadImage("open-email2.png");
    ei_btn.unreademailicon = loadImage("unread-email.png");

    image(ei_btn.emailfileicon, 240, 140);
    ei_btn.email_old1 = createFont("Arial Black", 12);
    textFont(ei_btn.email_old1);
    fill(0);
    text("Brian Lesczynski",320,160);

    image(ei_btn.unreademailicon, 240, 220);
    ei_btn.email_old2 = createFont("Arial Black", 12);
    textFont(ei_btn.email_old2);
    fill(0);
    text("Heather Fenner",320,240);

    image(ei_btn.unreademailicon, 240, 300);
    ei_btn.email_old3 = createFont("Arial Black", 12);
    textFont(ei_btn.email_old3);
    fill(0);
    text("Chris Tope",320,320);

    image(ei_btn.unreademailicon, 240, 380);
    ei_btn.email_old4 = createFont("Arial Black", 12);
    textFont(ei_btn.email_old4);
    fill(0);
    text("Nate Sankowski",320,400);

    image(ei_btn.unreademailicon, 240, 460);
    ei_btn.email_old5 = createFont("Arial Black", 12);
    textFont(ei_btn.email_old5);
    fill(0);
    text("Nate Sankowski",320,480);

    stroke(0);
    line(480,100,480,1080);
    ei_btn.email_from = createFont("Arial Black", 14);
    textFont(ei_btn.email_from);
    fill(0);
    text("From: Brian Lesczynski",500,140);
    ei_btn.email_to = createFont("Arial Black", 14);
    textFont(ei_btn.email_to);
    fill(0);
    text("To: Seth Romanowski",500,160);

    line(480,180,1080,180);
    ei_btn.email_body = createFont("Arial Black", 12);
    textFont(ei_btn.email_body);
    fill(0);
    text("Good morning Seth,",500,200);
    text("   We will have our weekly team meeting tomorrow at 9:00 A.M.",500,230);
    text("Please let me know if you have any questions.",500,250);
    text("Thank you,",500,285);
    text("Brian Lesczynski",500,305);


    gh_btn.displayHomeButton();
}

// Text Messaging
void displayTextInbox(){
    stroke(255);
    fill(255);
    rect(220,100,780,480);
    ti_btn.txt = loadImage("txt-msg-100x100.png");
    ti_btn.txt_flip = loadImage("txt-msg-flip-100x100.png");
    image(ti_btn.txt, 240, 140);
    image(ti_btn.txt, 240, 240);
    image(ti_btn.txt, 240, 340);
    image(ti_btn.txt, 240, 440);

    stroke(0);
    line(480,100,480,1080);
    ti_btn.txt_old1 = createFont("Arial Black", 12);
    textFont(ti_btn.txt_old1);
    fill(0);
    text("Mom",340,160);

    ti_btn.txt_old2 = createFont("Arial Black", 12);
    textFont(ti_btn.txt_old2);
    fill(0);
    text("Dad",340,260);

    ti_btn.txt_old3 = createFont("Arial Black", 12);
    textFont(ti_btn.txt_old3);
    fill(0);
    text("Yader",340,360);

    ti_btn.txt_old4 = createFont("Arial Black", 12);
    textFont(ti_btn.txt_old4);
    fill(0);
    text("Beto",340,460);

    line(480,180,1080,180);
    ti_btn.txt_from = createFont("Arial Black", 14);
    textFont(ti_btn.txt_from);
    fill(0);
    text("From: Mom - (616) 403-0560",500,140);
    ti_btn.txt_to = createFont("Arial Black", 14);
    textFont(ti_btn.txt_to);
    fill(0);
    text("To: Seth Romanowski - (616) 403-6517",500,160);

    image(ti_btn.txt, 500, 200);
    ti_btn.txt_from = createFont("Arial Black", 14);
    textFont(ti_btn.txt_from);
    fill(0);
    text("Mom - Hey how are you?",600,235);
    image(ti_btn.txt_flip, 900, 275);
    text("Good, how are you?",750,335);
    text("Mom - Good, are you coming over this weekend?",600,410);
    image(ti_btn.txt, 500, 375);
    text("Yes, I will be there in the morning",645,495);
    image(ti_btn.txt_flip, 900, 475);


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
  kr_btn.displayKitchen();
  br_btn.displayBathroom();
  bdr_btn.displayBedroom();
  lr_btn.displayLivingRoom();
  hr_btn.displayHallway();
  sl_btn.displayHomeLights();
  gh_btn.displayHomeButton();
 }
}