// Button Class

//          Buttons
// -----------------------------------------
// Main Menu
// - Smart Lights Module

// - Video Player Module
// - Messaging


class Button {
    int b_w, b_h, b_x, b_y, b_size = 50;
    
 
    int line_color, bg_color, number;

    boolean isPressed = false;
    boolean active = true;
    boolean rectOver = false, rectOver2 = false, rectOver3 = false, rectOver4 = false;
    boolean rectOver5 = false, rectOver6 = false, rectOver7 = false, rectOver8 = false;
    boolean imgOver = false, imgOver2 = false, imgOver3 = false, imgOver4 = false;
    boolean imgOver5 = false, imgOver6 = false, imgOver7 = false, imgOver8 = false;
  



    PFont rectStatus, imgStatus;
    
    // Button Icons
    PImage homeicon, lighticon, musicicon, emailicon, texticon, videoicon, hallwayicon, bathroomicon;
    PImage homelightsicon, settingsicon, kitchenicon, bedroomicon, livingroomicon;
    PImage playicon, pauseicon, stopicon;

    PImage gohomeicon;
    PImage musicfileicon, emailfileicon;
    
    PFont song1, song2, song3, song4, song5;

    PFont kitchenlabel;
    
    void setNumber(int num){ number=num; }
    void setWidth(int w){ b_w = w; }
    void setHeight(int h) { b_h = h; }
    void setX(int x) { b_x = x; }
    void setY(int y){ b_y = y; }
    void setLineColor(int clr){ line_color=clr; }
    void setBackgroundColor(int clr){ bg_color = clr; }
    
    void setInfo(int x, int y, int w, int h){
        setWidth(w);
        setHeight(h);
        setX(x);
        setY(y);
    }

    void setColors(int c1, int c2){
        line_color = c1;
        bg_color = c2;
    }
    
    void hide(int bg){
         stroke(bg);
         fill(bg);
         rect(b_x,b_y,b_w,b_h);
    }
    
    void display(){
        stroke(line_color);
        fill(bg_color);
        rect(b_x,b_y,b_w,b_h,15);
    }

    // Main Menu
    // - Row 1:
    //   Button 1: Smart Lights
    void displaySmartLights(){
        setInfo(80,20,300,215);
        setColors(0,255);
        display();
        homeicon = loadImage("home-icon2.png"); // 210 x 210
        image(homeicon,120,25);
    }
    
    void hideSmartLights(int x, int y, int w, int h){
        setInfo(x,y,w,h);
        if(app.isDark){
          hide(40);
        }
        else {
          hide(255);
        }
    }

    //  Button 2: Audio Library
    void displayAudioLibrary(){
        setInfo(390,20,300,215);
        setColors(0,255);
        display();
        musicicon = loadImage("music.png"); // 210 x 210
        image(musicicon,430,20);
    }

    void hideAudioLibrary(int x, int y, int w, int h){
        setInfo(x,y,w,h);
        if(app.isDark){
          hide(40);
        }
        else {
          hide(255);
        }
    }

    // Button 3 - Email Inbox
    void displayEmail(){
        setInfo(700,20,300,215);
        setColors(0,255);
        display();
        emailicon = loadImage("main-email.png"); // 190 x 190
        image(emailicon,750,30);
     //   emailfileicon = loadImage("open-email2.png");
    }

    void hideEmail(int x, int y, int w, int h){
        setInfo(x,y,w,h);
        if(app.isDark){
          hide(40);
        }
        else {
          hide(255);
        }
    }

    // - Row 2
    //   Button 4: Video Lirbary
     void displayVideoLibrary(){
        setInfo(80,245,300,215);
        setColors(0,255);
        display();
        videoicon = loadImage("Video-Icon.png"); // 210 x 210
        image(videoicon,120,250);
    }

    void hideVideoLibrary(int x, int y, int w, int h){
        setInfo(x,y,w,h);
        if(app.isDark){
          hide(40);
        }
        else {
          hide(255);
        }
    }

    //  Button 5: Text Messaging
    void displayTextMsg(){
        setInfo(390,245,300,215);
        setColors(0,255);
        display();
        texticon = loadImage("main-txt.png"); // 210 x 210
        image(texticon,440,255);
    }

    void hideTextMsg(int x, int y, int w, int h){
        setInfo(x,y,w,h);
        if(app.isDark){
          hide(40);
        }
        else {
          hide(255);
        }
    }

    //  Button 6: Settings
    void displaySettings(){
        setInfo(700,245,300,215);
        setColors(0,255);
        display();    
        settingsicon = loadImage("gear-icon.png"); // 210 x 210
        image(settingsicon,740,255);
    }

    void hideSettings(int x, int y, int w, int h){
        setInfo(x,y,w,h);
        if(app.isDark){
          hide(40);
        }
        else {
          hide(255);
        }
    }



    // Smart Lights
    // - Includes the following buttons:
    // 1. Kitchen Lights | 2. Bathroom Lights
    // 3. Bedroom Lights | 4. Living Room Lights
    // 5. Hallway Lights
      void displayRooms(){
        // Kitchen Button & Icon
        setInfo(10,10,110,110);
        setColors(0,255);
        display();
        kitchenicon = loadImage("kitchen-icon.png"); // 105 x 105
        image(kitchenicon,10,10);
        
        // kitchenlabel = createFont("Arial Black", 12);
        // textFont(kitchenlabel);
        // fill(255);
        // text("Kitchen",225,110);
        
        // Bathroom Button & Icon
        setInfo(10,130,110,110);
        setColors(0,255);
        display();
        bathroomicon = loadImage("bathroom-icon.png"); // 210 x 210
        image(bathroomicon,10,130);

        // Bedroom Button & Icon Info
        setInfo(10,250,110,110);
        setColors(0,255);
        display();
        bedroomicon = loadImage("bedroom-icon.png"); // 210 x 210
        image(bedroomicon,12,250);
        
        // Living Room Button & Icon
        setInfo(10,370,110,110);
        setColors(0,255);
        display();
        livingroomicon = loadImage("livingroomicon.png"); // 210 x 210
        image(livingroomicon,10,370);
        
        // Hallway Button & Icon
        setInfo(10,490,110,110);
        setColors(0,255);
        display();
        hallwayicon = loadImage("hallway-icon.png"); // 210 x 210
        image(hallwayicon,10,490);
        
        displayHomeLights();
    //    displayHomeButton();
    }
    

    
    void hideRooms(){
        // Kitchen Button
        setInfo(10,10,110,110);
        if(app.isDark){
          hide(40);
        }
        else {
          hide(255);
        }
        // Bathroom Button
        setInfo(10,130,110,110);
        if(app.isDark){
          hide(40);
        }
        else {
          hide(255);
        }
        // Bedroom Button
        setInfo(10,250,110,110);
        if(app.isDark){
          hide(40);
        }
        else {
          hide(255);
        }
        // Living Room Button
        setInfo(10,370,110,110);
        if(app.isDark){
          hide(40);
        }
        else {
          hide(255);
        }
        // Hallway Button
        setInfo(10,490,110,110);
        if(app.isDark){
          hide(40);
        }
        else {
          hide(255);
        }
        
    }


    void displayHomeLights(){
        homelightsicon = loadImage("apartment-all-lights-on.png"); // 210 x 210
        image(homelightsicon, 360, 110);
    }
    
    void displayHomeButton(){
        setInfo(950,10,85,85);
        setColors(0,255);
        display();
        gohomeicon = loadImage("gohomeicon.png"); // 210 x 210
        image(gohomeicon,954,14);
    }
    // Audio Library
    void displayAudioLibraryGrid(){
      // 
      musicfileicon = loadImage("music-file-icon.png"); // 75 x 75
      playicon = loadImage("play-icon.png"); // 75 x 48
      
      //
      image(musicfileicon,500,25);
      image(playicon,875,45);
      stroke(255);
      line(500, 100, 1000, 100);
      song1 = createFont("Arial Black", 18);
      textFont(song1);
      fill(255);
      text("Jingle Bells",600,80);
      //
      image(musicfileicon,500,125);
      image(playicon,875,145);
      line(500, 200, 1000, 200);
      image(musicfileicon,500,225);
      image(playicon,875,245);
      line(500, 300, 1000, 300);
      image(musicfileicon,500,325);
      image(playicon,875,345);
      line(500, 400, 1000, 400);
      image(musicfileicon,500,425);
      image(playicon,875,445);
      line(500, 500, 1000, 500);
    }

    // Video Library
    void displayPause(){
        setInfo(525,505,110,110);
        setColors(0,255);
        display();
        rect(b_x,b_y,b_w,b_h,15);
        pauseicon = loadImage("pause-icon.png"); // 210 x 210
        image(pauseicon,540,525);
    }
  

    // Text

    // Settings
}