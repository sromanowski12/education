// Button Class

//          Buttons
// -----------------------------------------
// Main Menu
// - Smart Lights Module

// - Video Player Module
// - Messaging


class Button {
    int b_width, b_height, b_x, b_y, b_size = 50;
    
    int[] sl_info = new int[3];
    
    int b_al_width, b_al_height, b_al_x, b_al_y, b_al_size = 50;
 
    int b_line_color, b_bg_color, b_number;

    boolean isPressed = false;
    boolean active = true;
    
    color rectColor, baseColor;
    color rectHighlight;
    color currentColor;

    boolean rectOver = false;

    boolean imgOver = false;
    boolean pressed = false;
    
    PImage homeicon, lighticon, musicicon, texticon, videoicon, hallwayicon, bathroomicon;
    PImage homelightsicon, settingsicon, kitchenicon, bedroomicon, livingroomicon;
    
    PImage playicon, pauseicon, stopicon;

    PImage gohomeicon;
    
    void setButtonNumber(int num){ b_number=num; }
    void setButtonWidth(int w){ b_width = w; }
    void setButtonHeight(int h) { b_height = h; }
    void setButtonX(int x) { b_x = x; }
    void setButtonY(int y){ b_y = y; }
    void setLineColor(int clr){ b_line_color=clr; }
    void setBackgroundColor(int clr){ b_bg_color = clr; }
    
    void setButtonInfo(int x, int y, int w, int h){
        setButtonWidth(w);
        setButtonHeight(h);
        setButtonX(x);
        setButtonY(y);
    }

    void setButtonColors(int c1, int c2){
        b_line_color = c1;
        b_bg_color = c2;
    }
    
    void hideButton(int bg){
         stroke(bg);
         fill(bg);
         rect(b_x,b_y,b_width,b_height);
    }
    
    void displayButton(){
        stroke(b_line_color);
        fill(b_bg_color);
        rect(b_x,b_y,b_width,b_height,15);
    }

    // Main Menu
    // - Row 1:
    //   Button 1: Smart Lights
    void displaySmartLightsButton(){
        setButtonInfo(80,20,300,215);

        b_line_color = 0;
        b_bg_color = 255;
        displayButton();
        homeicon = loadImage("home-icon2.png"); // 210 x 210
        image(homeicon,120,25);
    }
    
    void hideSmartLightsButton(int x, int y, int w, int h){
        setButtonInfo(x,y,w,h);
        if(app.isDark){
          hideButton(40);
        }
        else {
          hideButton(255);
        }
    }

    //  Button 2: Audio Library
    void displayAudioLibraryButton(){
        setButtonInfo(390,20,300,215);

        b_line_color = 0;
        b_bg_color = 255;
        displayButton();
        musicicon = loadImage("music.png"); // 210 x 210
        image(musicicon,430,20);
    }

    void hideAudioLibraryButton(int x, int y, int w, int h){
        setButtonInfo(x,y,w,h);
        if(app.isDark){
          hideButton(40);
        }
        else {
          hideButton(255);
        }
    }

    // Button 3 - Email Inbox
    void displayEmailButton(){
        setButtonInfo(700,20,300,215);

        b_line_color = 0;
        b_bg_color = 255;
        displayButton();
        homeicon = loadImage("main-email.png"); // 190 x 190
        image(homeicon,750,30);
    }

    void hideEmailButton(int x, int y, int w, int h){
        setButtonInfo(x,y,w,h);
        if(app.isDark){
          hideButton(40);
        }
        else {
          hideButton(255);
        }
    }

    // - Row 2
    //   Button 4: Video Lirbary
     void displayVideoLibraryButton(){
        setButtonInfo(80,245,300,215);

        b_line_color = 0;
        b_bg_color = 255;
        displayButton();
        videoicon = loadImage("Video-Icon.png"); // 210 x 210
        image(videoicon,120,250);
    }

    void hideVideoLibraryButton(int x, int y, int w, int h){
        setButtonInfo(x,y,w,h);
        if(app.isDark){
          hideButton(40);
        }
        else {
          hideButton(255);
        }
    }

    //  Button 5: Text Messaging
    void displayTextButton(){
        setButtonInfo(390,245,300,215);

        b_line_color = 0;
        b_bg_color = 255;
        
        displayButton();
        texticon = loadImage("main-txt.png"); // 210 x 210
        image(texticon,440,255);
    }

    void hideTextButton(int x, int y, int w, int h){
        setButtonInfo(x,y,w,h);
        if(app.isDark){
          hideButton(40);
        }
        else {
          hideButton(255);
        }
    }

    //  Button 6: Settings
    void displaySettingsButton(){
        setButtonInfo(700,245,300,215);

        b_line_color = 0;
        b_bg_color = 255;
        displayButton();    
        settingsicon = loadImage("gear-icon.png"); // 210 x 210
        image(settingsicon,740,255);
    }

    void hideSettingsButton(int x, int y, int w, int h){
        setButtonInfo(x,y,w,h);
        if(app.isDark){
          hideButton(40);
        }
        else {
          hideButton(255);
        }
    }



    // Smart Lights
    // - Includes the following buttons:
    // 1. Kitchen Lights | 2. Bathroom Lights
    // 3. Bedroom Lights | 4. Living Room Lights
    // 5. Hallway Lights
    void displayRoomsButton(){
        // Kitchen Button & Icon
        setButtonInfo(10,10,110,110);
        setButtonColors(0,255);
        displayButton();
        kitchenicon = loadImage("kitchen-icon.png"); // 105 x 105
        image(kitchenicon,10,10);
        
        // Bathroom Button & Icon
        setButtonInfo(10,130,110,110);
        setButtonColors(0,255);
        displayButton();
        bathroomicon = loadImage("bathroom-icon.png"); // 210 x 210
        image(bathroomicon,10,130);

        // Bedroom Button & Icon Info
        setButtonInfo(10,250,110,110);

        setButtonColors(0,255);
        displayButton();
        bedroomicon = loadImage("bedroom-icon.png"); // 210 x 210
        image(bedroomicon,12,250);
        
        // Living Room Button & Icon
        setButtonInfo(10,370,110,110);
        setButtonColors(0,255);
        displayButton();
        livingroomicon = loadImage("livingroomicon.png"); // 210 x 210
        image(livingroomicon,10,370);
        
        // Hallway Button & Icon
        setButtonInfo(10,490,110,110);
        setButtonColors(0,255);
        displayButton();
        hallwayicon = loadImage("hallway-icon.png"); // 210 x 210
        image(hallwayicon,10,490);
        
        displayHomeLights();

        displayHomeButton();
    }
    
    void displayHomeLights(){
        homelightsicon = loadImage("apartment-all-lights-on.png"); // 210 x 210
        image(homelightsicon, 360, 110);
    }
    
    void displayHomeButton(){
        setButtonInfo(500,10,80,80);

        b_line_color = 0;
        b_bg_color = 255;
        displayButton();
        gohomeicon = loadImage("gohomeicon.png"); // 210 x 210
        image(hallwayicon,500,10);
    }


    // Video Library
    void displayPauseButton(){
        setButtonInfo(525,505,110,110);

        b_line_color = 0;
        b_bg_color = 255;
        displayButton();
        rect(b_x,b_y,b_width,b_height,15);
        pauseicon = loadImage("pause-icon.png"); // 210 x 210
        image(pauseicon,540,525);
    }
  

    // Text

    // Settings
}