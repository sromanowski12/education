

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
    
    color rectColor, baseColor;
    color rectHighlight;
    color currentColor;

    boolean rectOver = false;

    boolean imgOver = false;
    boolean pressed = false;
    
    PImage homeicon, lighticon;
    
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
    
    void hideButton(int bg){
         stroke(bg);
         fill(bg);
         rect(b_x,b_y,b_width,b_height);
    }
    
    void displayButton(){
        stroke(b_line_color);
        fill(b_bg_color);
        rect(b_x,b_y,b_width,b_height);
    }

    // Main Menu
    // Row 1
    void displaySmartLightsButton(){
        b_width = 300;
        b_height = 215;
        b_x = 80;
        b_y = 20;
        
        setButtonInfo(b_x,b_y,b_width,b_height);

        b_line_color = 0;
        b_bg_color = 255;
        displayButton();
        homeicon = loadImage("home-icon2.png"); // 210 x 210
        image(homeicon,120,25);
    }
    
    void hideSmartLightsButton(int x, int y, int w, int h){
        setButtonInfo(390,20,300,215);

        hideButton(0);
    }

    void displayAudioLibraryButton(){
        setButtonInfo(390,20,300,215);

        b_line_color = 0;
        b_bg_color = 255;
        displayButton();
        homeicon = loadImage("home-icon2.png"); // 210 x 210
        image(homeicon,120,25);
    }

    void displayEmailButton(){
        setButtonInfo(700,20,300,215);

        b_line_color = 0;
        b_bg_color = 255;
        displayButton();
        homeicon = loadImage("home-icon2.png"); // 210 x 210
        image(homeicon,120,25);
    }

    // Row 2
     void displayVideoLibraryButton(){
        setButtonInfo(80,245,300,215);

        b_line_color = 0;
        b_bg_color = 255;
        displayButton();
        homeicon = loadImage("home-icon2.png"); // 210 x 210
        image(homeicon,120,25);
    }

    void displayTextButton(){
        setButtonInfo(390,245,300,215);

        b_line_color = 0;
        b_bg_color = 255;
        
        displayButton();
        homeicon = loadImage("home-icon2.png"); // 210 x 210
        image(homeicon,120,25);
    }

    void displaySettingsButton(){
        setButtonInfo(700,245,300,215);

        b_line_color = 0;
        b_bg_color = 255;
        displayButton();    
        homeicon = loadImage("home-icon2.png"); // 210 x 210
        image(homeicon,120,25);
    }


    // Smart Lights

    // Audio Library

    // Email

    // Video Library
    void displayPlayVideoButton(){
      stroke(0);
      ellipse(0,0,50,50);
      
    }
    
    void displayPauseVideoButton(){
      
    }
    
    void displayNextVideoButton(){
      
    }

    // Text

    // Settings
}