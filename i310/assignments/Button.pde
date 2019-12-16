// Button Class
// 


class Button {
  // Button Properties
  int b_w, b_h, b_x, b_y, b_size = 50;
  int line_color, bg_color, number;

  boolean isPressed = false;
  boolean active = false;
  boolean disable = true;
  boolean rectOver = false;
  boolean imgOver = false;

  // Text - Labels / Songs / Titles
  PFont rectStatus, imgStatus;
  PFont song1, song2, song3, song4, song5, artist;
  PFont mov_title1, mov_title2, mov_title3;    
  PFont mov_year1, mov_year2, mov_year3;

  PFont email_from, email_to;
  PFont txt_from, txt_to;
  PFont email_old1, email_old2, email_old3, email_old4, email_old5;
  PFont txt_old1, txt_old2, txt_old3, txt_old4;
  PFont email_body;
  PFont darkStatus, lightStatus;

  // Images - Button Icons
  PImage homeicon, lighticon, musicicon, emailicon, texticon, videoicon, hallwayicon, bathroomicon;
  PImage homelightsicon, settingsicon, kitchenicon, bedroomicon, livingroomicon;
  PImage lighticon_on, lighticon_off, lighticon_on_flip, lighticon_off_flip;

  PImage mov1, mov2, mov3, mov4, mov5;
  PImage txt, txt_flip;
  PImage playicon, pauseicon, stopicon, album1, album2;
  PImage musicfileicon, emailfileicon, unreademailicon;
  PImage gohomeicon;
  PImage switchOn, switchOff;
  
  // Functions - Set Button Properties
  void setNumber(int num){ number=num; }              // Assigns a value to number variable
  void setWidth(int w){ b_w = w; }                    // Assings a value to b_w variable
  void setHeight(int h) { b_h = h; }                  // Assings a value to b_h variable
  void setX(int x) { b_x = x; }                       // Assings a value to b_x variable
  void setY(int y){ b_y = y; }                        // Assings a value to b_y variable
  void setSize(int s){ b_size = s; }                  // Assings a value to b_size variable
  void setLineColor(int clr){ line_color=clr; }       // Assigns a value to line_color variable
  void setBackgroundColor(int clr){ bg_color = clr; } // Assigns a value to bg_color variable
  
  // Used to call functions that set height, width, x & y values
  void setInfo(int x, int y, int w, int h){
      setWidth(w);
      setHeight(h);
      setX(x);
      setY(y);
  }
  // Assigns values to the background and line color
  void setColors(int c1, int c2){
      line_color = c1;
      bg_color = c2;
  }
  // Hides the background and line color of button
  void hide(int bg){
        stroke(bg);
        fill(bg);
        rect(b_x,b_y,b_w,b_h);
  }
  // Display the background and line color of button
  void display(){
      stroke(line_color);
      fill(bg_color);
      rect(b_x,b_y,b_w,b_h,15);
  }

  // Main Menu Functions
  // - Row 1:
  //   Button 1: Smart Lights - Display
  void displaySmartLights(){
      setInfo(80,100,300,215);
      setColors(0,255);
      display();
      homeicon = loadImage("home-icon2.png"); // 210 x 210
      image(homeicon,120,105);
  }
  //   Button 1: Smart Lights - Hide
  void hideSmartLights(int x, int y, int w, int h){
      setInfo(x,y,w,h);
      if(main.isDark){
        hide(40);
      }
      else {
        hide(255);
      }
  }

  //  Button 2: Audio Library - Display
  void displayAudioLibrary(){
      setInfo(390,100,300,215);
      setColors(0,255);
      display();
      musicicon = loadImage("music.png"); // 210 x 210
      image(musicicon,430,100);
  }
  //  Button 2: Audio Library - Hide
  void hideAudioLibrary(int x, int y, int w, int h){
      setInfo(x,y,w,h);
      if(main.isDark){
        hide(40);
      }
      else {
        hide(255);
      }
  }

  //  Button 3: Email Inbox - Display
  void displayEmail(){
      setInfo(700,100,300,215);
      setColors(0,255);
      display();
      emailicon = loadImage("main-email.png"); // 190 x 190
      image(emailicon,750,110);
    //   emailfileicon = loadImage("open-email2.png");
  }
  //  Button 3: Email Inbox - Hide
  void hideEmail(int x, int y, int w, int h){
      setInfo(x,y,w,h);
      if(main.isDark){
        hide(40);
      }
      else {
        hide(255);
      }
  }

  // - Row 2
  //   Button 4: Video Library - Display
    void displayVideoLibrary(){
      setInfo(80,325,300,215);
      setColors(0,255);
      display();
      videoicon = loadImage("Video-Icon.png"); // 210 x 210
      image(videoicon,120,330);
  }
  //   Button 4: Video Library - Hide
  void hideVideoLibrary(int x, int y, int w, int h){
      setInfo(x,y,w,h);
      if(main.isDark){
        hide(40);
      }
      else {
        hide(255);
      }
  }

  //  Button 5: Text Messaging - Display
  void displayTextMsg(){
      setInfo(390,325,300,215);
      setColors(0,255);
      display();
      texticon = loadImage("main-txt.png"); // 210 x 210
      image(texticon,440,335);
  }
  //  Button 5: Text Messaging - Hide
  void hideTextMsg(int x, int y, int w, int h){
      setInfo(x,y,w,h);
      if(main.isDark){
        hide(40);
      }
      else {
        hide(255);
      }
  }

  //  Button 6: Settings - Display
  void displaySettings(){
      setInfo(700,325,300,215);
      setColors(0,255);
      display();    
      settingsicon = loadImage("gear-icon.png"); // 210 x 210
      image(settingsicon,740,335);
  }
  //  Button 6: Settings - Hide
  void hideSettings(int x, int y, int w, int h){
      setInfo(x,y,w,h);
      if(main.isDark){
        hide(40);
      }
      else {
        hide(255);
      }
  }

  // Smart Lights - Display Rooms
  // Kitchen Button & Icon
  void displayKitchen(){
    setInfo(10,10,110,110);
    setColors(0,255);
    display();
    kitchenicon = loadImage("kitchen-icon.png"); // 105 x 105
    image(kitchenicon,10,10);
  }
  // Bathroom Button & Icon
  void displayBathroom(){
    setInfo(10,130,110,110);
    setColors(0,255);
    display();
    bathroomicon = loadImage("bathroom-icon.png"); // 210 x 210
    image(bathroomicon,10,130);
  }
  // Bedroom Button & Icon
  void displayBedroom(){
    setInfo(10,250,110,110);
    setColors(0,255);
    display();
    bedroomicon = loadImage("bedroom-icon.png"); // 210 x 210
    image(bedroomicon,12,250);
  }
  // Living Room Button & Icon
  void displayLivingRoom(){
    setInfo(10,370,110,110);
    setColors(0,255);
    display();
    livingroomicon = loadImage("livingroomicon.png"); // 210 x 210
    image(livingroomicon,10,370);
  }
  // Hallway Button & Icon
  void displayHallway(){
    setInfo(10,490,110,110);
    setColors(0,255);
    display();
    hallwayicon = loadImage("hallway-icon.png"); // 210 x 210
    image(hallwayicon,10,490);
  }
  
  // Smart Lights - Hide Rooms
  void hideRooms(){
      // Kitchen Button
      setInfo(10,10,110,110);
      if(main.isDark){
        hide(40);
      }
      else {
        hide(255);
      }
      // Bathroom Button
      setInfo(10,130,110,110);
      if(main.isDark){
        hide(40);
      }
      else {
        hide(255);
      }
      // Bedroom Button
      setInfo(10,250,110,110);
      if(main.isDark){
        hide(40);
      }
      else {
        hide(255);
      }
      // Living Room Button
      setInfo(10,370,110,110);
      if(main.isDark){
        hide(40);
      }
      else {
        hide(255);
      }
      // Hallway Button
      setInfo(10,490,110,110);
      if(main.isDark){
        hide(40);
      }
      else {
        hide(255);
      }
  }

  // Display Floor Layout
  void displayHomeLights(){
      homelightsicon = loadImage("apartment-layout.png"); // 210 x 210
      lighticon_on = loadImage("light-on-45x45.png");
      image(homelightsicon, 360, 110);
      
      // Bathroom Lights - On
      image(lighticon_on, 590,440);

      // Kitchen Lights - On
      image(lighticon_on, 752,380);

      // Living Room Lights - On
      image(lighticon_on, 992,270);
      image(lighticon_on, 752,190);
      lighticon_on = loadImage("light-on-flip-45x45.png");
      image(lighticon_on, 772, 200);

      // Hallway Lights - On
      lighticon_on = loadImage("light-on-45x45.png");
      image(lighticon_on, 620,250);
      lighticon_on = loadImage("light-on-flip-45x45.png");
      image(lighticon_on, 640, 260);
      
      // Bedroom Lights - On
      lighticon_on = loadImage("light-on-45x45.png");
      image(lighticon_on, 490,250);
      lighticon_on = loadImage("light-on-flip-45x45.png");
      image(lighticon_on, 510, 260);
  }

  // Display Go Home Button
  void displayHomeButton(){
      setInfo(950,10,85,85);
      setColors(0,255);
      display();
      gohomeicon = loadImage("gohomeicon.png"); // 210 x 210
      image(gohomeicon,954,14);
  }

  // Display Audio Library
  void displayAudioLibraryGrid(){
    // Audio Library Icons
    playicon = loadImage("play-icon.png");            // 75 x 48
    album1 = loadImage("Nothing But the Best.jpg");   // 75 x 75
    album2 = loadImage("A Jolly Christmas.jpg");      // 75 x 75
    
    // Row 1 - "A Jolly Christmas"
    // Song 1 - "Jingle Bells"
    image(album2,250,25);
    image(playicon,875,45);

    if(main.isDark){
      stroke(255);
    } else {
      stroke(0);
    }

    line(250, 100, 1000, 100);
    song1 = createFont("Arial Black", 18);
    artist = createFont("Arial Black", 14);
    textFont(song1);

    if(main.isDark){
      fill(255);
    } else {
      fill(0);
    }

    text("Jingle Bells",350,80);
    textFont(artist);

    if(main.isDark){
      fill(255);
    } else {
      fill(0);
    }
    
    text("By: Frank Sinatra",730,90);

    // Row 2 - "Nothing But the Best"
    // Song 2 - "Come Fly With Me"
    image(album1,250,125);

    image(playicon,875,145);
    line(250, 200, 1000, 200);
    song2 = createFont("Arial Black", 18);
    textFont(song2);

    if(main.isDark){
      fill(255);
    } else {
      fill(0);
    }

    text("Come Fly With Me",350,180);
    textFont(artist);

    if(main.isDark){
      fill(255);
    } else {
      fill(0);
    }

    text("By: Frank Sinatra",730,195);

    // Row 3 - "Nothing But the Best"
    // Song 3 - "The Way You Look Tonight"
    image(album1,250,225);
    image(playicon,875,245);
    line(250, 300, 1000, 300);
    song3 = createFont("Arial Black", 18);
    textFont(song3);

    if(main.isDark){
      fill(255);
    } else {
      fill(0);
    }
    
    text("The Way You Look Tonight",350,280);
    textFont(artist);

    if(main.isDark){
      fill(255);
    } else {
      fill(0);
    }

    text("By: Frank Sinatra",730,295);

    // Row 4 - "Nothing But the Best"
    // Song 4 - "Fly Me to the Moon"
    image(album1,250,325);
    image(playicon,875,345);
    line(250, 400, 1000, 400);
    song4 = createFont("Arial Black", 18);
    textFont(song4);

    if(main.isDark){
      fill(255);
    } else {
      fill(0);
    }

    text("Fly Me to the Moon",350,380);
    textFont(artist);

    if(main.isDark){
      fill(255);
    } else {
      fill(0);
    }

    text("By: Frank Sinatra",730,395);

    // Row 5 - "Nothing But the Best"
    // Song 5 - "My Way"
    image(album1,250,425);
    image(playicon,875,445);
    line(250, 500, 1000, 500);
    song5 = createFont("Arial Black", 18);
    textFont(song5);

    if(main.isDark){
      fill(255);
    } else {
      fill(0);
    }

    text("My Way",350,480);
    textFont(artist);

    if(main.isDark){
      fill(255);
    } else {
      fill(0);
    }

    text("By: Frank Sinatra",730,495);
  }

  // Video Library
  void displayVideoLibraryGrid(){
    // Video Library Icons
    playicon = loadImage("play-icon.png");              // 75 x 48
    mov1 = loadImage("blockers-cover-100x133.png");     // 100 x 133
    mov2 = loadImage("game_night_cover-100x150.png");   // 100 x 150
    mov3 = loadImage("fallout-cover-100x156.png");      // 100 x 156
    
    // Movie 1 - "Blockers"
    image(mov1,250,25);
    image(playicon,875,95);

    if(main.isDark)
    {
      stroke(255);
    } else {
      stroke(0);
    }

    line(250, 155, 1000, 155);
    mov_title1 = createFont("Arial Black", 18);
    mov_year1 = createFont("Arial Black", 14);
    textFont(mov_title1);

    if(main.isDark)
    {
      fill(255);
    } else {
      fill(0);
    }
    
    text(movieTitle1,350,140);
    textFont(mov_year1);

    if(main.isDark)
    {
      fill(255);
    } else {
      fill(0);
    }

    text("Released: 2018",730,140);

    // Movie 2 - "Game Night"
    image(mov2,250,165);
    image(playicon,875,250);
    line(250, 320, 1000, 320);
    mov_title2 = createFont("Arial Black", 18);
    mov_year2 = createFont("Arial Black", 14);
    textFont(mov_title2);

    if(main.isDark)
    {
      fill(255);
    } else {
      fill(0);
    }

    text("Game Night",350,305);
    textFont(mov_year2);

    if(main.isDark)
    {
      fill(255);
    } else {
      fill(0);
    }

    text("Released: 2018",730,305);

    // Movie 3 - "Mission Impossible: Fallout"
    image(mov3,250,325);
    image(playicon,875,415);
    line(250, 480, 1000, 480);
    mov_title3 = createFont("Arial Black", 18);
    mov_year3 = createFont("Arial Black", 14);
    textFont(mov_title3);
    
    if(main.isDark)
    {
      fill(255);
    } else {
      fill(0);
    }

    text("Mission Impossible: Fallout",350,470);
    textFont(mov_year3);

    if(main.isDark)
    {
      fill(255);
    } else {
      fill(0);
    }

    text("Released: 2018",730,470);
  }

  // Settings
  // Display Off Switch Button
  void displaySwitchOff(){
      setInfo(10,10,132,80);
      setColors(0,255);
      display();
      rect(b_x,b_y,b_w,b_h,15);
      switchOff = loadImage("offSwitch.png"); // 132 x 80
      image(switchOff, 10, 10);

      darkStatus = createFont("Arial Black", 24);
      textFont(darkStatus);
      fill(255);
      
      text("Dark Mode",530,100);
      textFont(darkStatus);
  }
  // Display On Switch Button
  void displaySwitchOn(){
      setInfo(10,10,132,80);
      setColors(0,255);
      display();
      rect(b_x,b_y,b_w,b_h,15);
      switchOn = loadImage("onSwitch.png"); // 132 x 80
      image(switchOn, 10, 10);

      lightStatus = createFont("Arial Black", 24);
      textFont(lightStatus);
      fill(0);
      
      text("Light Mode",530,100);
      textFont(lightStatus);
    }
}