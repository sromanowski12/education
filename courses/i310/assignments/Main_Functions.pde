Movie mov;
SoundFile frank1;

boolean playing = false;
boolean stopped = false;

String movieTitle1="Blockers", movieTitle2="Equalizer 2", movieTitle3="Mission Impossible: Fallout", movieTitle4="Game Might";

String moviePath1 = "Blockers.mp4";

String songTitle1="The Way You Look Tonight.mp3";

void movieEvent(Movie m) {
  m.read();
}

boolean overRect(int x, int y, int width, int height) { 
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {
  // Main Menu
  // Smart Lights Button
  if (main.sl_btn.rectOver == true) { 
    if (main.sl_btn.imgOver == true) { 
      main.sl_btn.imgOver = false;
    } else {
      main.sl_btn.imgOver = true;
    }
  }
  // Audio Library Button
  if (main.al_btn.rectOver == true) { 
   // frank1.play();
    if (main.al_btn.imgOver == true) { 
      main.al_btn.imgOver = false;
      
    } else {
      main.al_btn.imgOver = true;
    }
  }
  // Email Inbox Button
  if (main.ei_btn.rectOver == true) { 
    if (main.ei_btn.imgOver == true) { 
      main.ei_btn.imgOver = false;
    } else {
      main.ei_btn.imgOver = true;
    }
  }
  // Video library Button
  if (main.vl_btn.rectOver == true) {
    if (main.vl_btn.imgOver == true) { 
      main.vl_btn.imgOver = false;
    } else {
      main.vl_btn.imgOver = true;
    }
  }
  // Text Messaging Button
  if (main.ti_btn.rectOver == true) { 
    if (main.ti_btn.imgOver == true) { 
      main.ti_btn.imgOver = false;
    } else {
      main.ti_btn.imgOver = true;
    }
  }
  // Settings Button
  if (main.am_btn.rectOver == true) { 
    if (main.am_btn.imgOver == true) { 
      main.am_btn.imgOver = false;
    } else {
      main.am_btn.imgOver = true;
    }
  }
  // Smart Lights
  // Go Home Button
  if(main.gh_btn.rectOver == true) {
    if(main.gh_btn.imgOver == true) {
      main.gh_btn.imgOver = false;
    //  main.sl_btn.imgOver = true;
    } else {
      main.gh_btn.imgOver = true;
    //  main.sl_btn.imgOver = false;
    }
  }

  // Kitchen Lights Button
  if(main.kr_btn.rectOver == true) {
    if(main.kr_btn.imgOver == true) {
      main.kr_btn.imgOver = false;
    } else {
      main.kr_btn.imgOver = true;
    }
  }

  // Bathroom Lights Button
  if(main.br_btn.rectOver == true) {
    if(main.br_btn.imgOver == true) {
      main.br_btn.imgOver = false;
    } else {
      main.br_btn.imgOver = true;
    }
  }

  // Bedroom Lights Button
  if(main.bdr_btn.rectOver == true) {
    if(main.bdr_btn.imgOver == true) {
      main.bdr_btn.imgOver = false;
    } else {
      main.bdr_btn.imgOver = true;
    }
  }

  // Living Room Lights Button
  if(main.lr_btn.rectOver == true) {
    if(main.lr_btn.imgOver == true) {
      main.lr_btn.imgOver = false;
    } else {
      main.lr_btn.imgOver = true;
    }
  }

  // Hallway Lights Button
  if(main.hr_btn.rectOver == true) {
    if(main.hr_btn.imgOver == true) {
      main.hr_btn.imgOver = false;
    } else {
      main.hr_btn.imgOver = true;
    }
  }


  // Audio Library Buttons
  // if(main.play_btn1.rectOver == true) {
  //   if(main.play_btn1.imgOver == true) {
  //     main.play_btn1.imgOver = false;
  //   } else {
  //     main.play_btn1.imgOver = true;
  //   }
  // }
  // Video library
  // Pause Button 
  // if(main.pause.rectOver == true) {
  //   if(main.pause.imgOver == true) {
  //     main.pause.imgOver = false;
  //   } else {
  //     main.pause.imgOver = true;
  //   }
  // }

  // Settings
  // Switch Button 
  if(main.switch_btn.rectOver == true) {
    if(main.switch_btn.imgOver == true) {
      main.switch_btn.imgOver = false;
    } else {
      main.switch_btn.imgOver = true;
    }
  }
}

void updateMain(int x, int y) { 
  // Main Menu
  // Smart Lights Button
  if ( overRect(main.sl_btn.b_x, main.sl_btn.b_y, main.sl_btn.b_w,main.sl_btn.b_h)) {
    main.sl_btn.rectOver = true;
  } else {
    main.sl_btn.rectOver = false;
  }
  // Audio Library Button
  if ( overRect(main.al_btn.b_x, main.al_btn.b_y, main.al_btn.b_w, main.al_btn.b_h) ) {
    main.al_btn.rectOver = true;
  } else {
    main.al_btn.rectOver = false;
  }
  // Email Inbox Button
  if ( overRect(main.ei_btn.b_x, main.ei_btn.b_y, main.ei_btn.b_w,main.ei_btn.b_h)) {
    main.ei_btn.rectOver = true;
  } else {
    main.ei_btn.rectOver = false;
  }
  // Video Library Button
  if ( overRect(main.vl_btn.b_x, main.vl_btn.b_y,main.vl_btn.b_w, main.vl_btn.b_h) ) {
    main.vl_btn.rectOver = true;
  } else {
    main.vl_btn.rectOver = false;
  }
  // Text Messaging Button
  if ( overRect(main.ti_btn.b_x, main.ti_btn.b_y, main.ti_btn.b_w, main.ti_btn.b_h) ) {
    main.ti_btn.rectOver = true;
  } else {
    main.ti_btn.rectOver = false;
  }
    // Settings Button
  if ( overRect(main.am_btn.b_x, main.am_btn.b_y, main.am_btn.b_w, main.am_btn.b_h) ) {
    main.am_btn.rectOver = true;
  } else {
    main.am_btn.rectOver = false;
  }

  // Smart Lights
  // Go Home Button
  if ( overRect(main.gh_btn.b_x, main.gh_btn.b_y, main.gh_btn.b_w,main.gh_btn.b_h)) {
    main.gh_btn.rectOver = true;
  //  main.sl_btn.rectOver = false;
  } else {
    main.gh_btn.rectOver = false;
   // main.sl_btn.rectOver = true;
  }

  // Kitchen Lights Button
  if ( overRect(main.kr_btn.b_x, main.kr_btn.b_y, main.kr_btn.b_w,main.kr_btn.b_h)) {
    main.kr_btn.rectOver = true;
  } else {
    main.kr_btn.rectOver = false;
  }

  // Bathroom Lights Button
  if ( overRect(main.br_btn.b_x, main.br_btn.b_y, main.br_btn.b_w,main.br_btn.b_h)) {
    main.br_btn.rectOver = true;
  } else {
    main.br_btn.rectOver = false;
  }

  // Bedroom Lights Button
  if ( overRect(main.bdr_btn.b_x, main.bdr_btn.b_y, main.bdr_btn.b_w,main.bdr_btn.b_h)) {
    main.bdr_btn.rectOver = true;
  } else {
    main.bdr_btn.rectOver = false;
  }

  // Living Room Lights Button
  if ( overRect(main.lr_btn.b_x, main.lr_btn.b_y, main.lr_btn.b_w,main.lr_btn.b_h)) {
    main.lr_btn.rectOver = true;
  } else {
    main.lr_btn.rectOver = false;
  }

  // Hallway Lights Button
  if ( overRect(main.hr_btn.b_x, main.hr_btn.b_y, main.hr_btn.b_w,main.hr_btn.b_h)) {
    main.hr_btn.rectOver = true;
  } else {
    main.hr_btn.rectOver = false;
  }

  // Audio Library
  // Play Button
  // if ( overRect(main.play_btn1.b_x, main.play_btn1.b_y, main.play_btn1.b_w, main.play_btn1.b_h) ) {
  //   main.play_btn1.rectOver = true;
  // } else {
  //   main.play_btn1.rectOver = false;
  // }

  
  // // Video Library
  // // Pause Button
  // if ( overRect(main.pause.b_x, main.pause.b_y, main.pause.b_w, main.pause.b_h) ) {
  //   main.pause.rectOver = true;
  // } else {
  //   main.pause.rectOver = false;
  // }

  // Settings
  // Settings Switch Button
  if ( overRect(main.switch_btn.b_x, main.switch_btn.b_y, main.switch_btn.b_w,main.switch_btn.b_h) ) {
    main.switch_btn.rectOver = true;
  } else {
    main.switch_btn.rectOver = false;
  }
}




// Button Actions
void checkButtons(){

    // Main Menu Buttons
    // Smart Lights Button
    if (main.sl_btn.imgOver == true) {
        if(main.isDark){
            main.clearHomeScreenDark();
            main.displaySmartLightsDark();
        } else{
            main.clearHomeScreen();
            main.displaySmartLights();
        }
    }
    // Audio Library Button
      if (main.al_btn.imgOver == true) {
        if(main.isDark){
            main.clearHomeScreenDark();
            main.displayAudioLibraryDark();
        } else {
            main.clearHomeScreen();
        }
    }
  // Email Inbox Button
    if (main.ei_btn.imgOver == true) {
      if(main.isDark){
          main.clearHomeScreenDark();
          main.displayEmailInbox();
      } else {
          main.clearHomeScreen();
      }
    }
    // Video Library Button
     if (main.vl_btn.imgOver == true) {
        main.clearHomeScreenDark();
      //  image(main.vl_btn.videoicon,400,50);  
      //  mov.play();
      //  mov.speed(0);
      //  mov.volume(2);
      //  image(mov,0,0,width,height);
        main.vl_btn.displayVideoLibraryGrid();
        main.gh_btn.displayHomeButton();
  //      main.displayVideoLibraryButtons();
    }
    // Text Messaging Button
    if (main.ti_btn.imgOver == true) {
      if(main.isDark){
          main.clearHomeScreenDark();
          main.displayTextInbox();
      } else {
          main.clearHomeScreen();
          main.displayTextInbox();
      }
    }
    // Settings Button
     if (main.am_btn.imgOver == true) {
      if(main.isDark){
          main.clearHomeScreenDark();
          main.isDark = true;
          main.switch_btn.displaySwitchOff();
          main.gh_btn.displayHomeButton();
      } else {
          main.clearHomeScreen();
          main.isDark = false;
          main.switch_btn.displaySwitchOff();
          main.gh_btn.displayHomeButton();
      }
    }

    // Smart Lights Buttons
    // Kitchen Lights - Off
    if (main.kr_btn.imgOver == true) {
      main.kr_btn.lighticon_off = loadImage("light-off-45x45.png");
      image(main.kr_btn.lighticon_off, 752, 380);
    }
    // Bathroom Lights - Off
    if (main.br_btn.imgOver == true) {
      main.br_btn.lighticon_off = loadImage("light-off-45x45.png");
      image(main.br_btn.lighticon_off, 590, 440);
    }
    // Bedroom Lights - Off
    if (main.bdr_btn.imgOver == true) {
      main.bdr_btn.lighticon_off = loadImage("light-off-45x45.png");
      image(main.bdr_btn.lighticon_off, 490,250);
      main.bdr_btn.lighticon_off = loadImage("light-off-flip-45x45.png");
      image(main.bdr_btn.lighticon_off, 510, 260);
    }
    // Living Room Lights - Off
    if (main.lr_btn.imgOver == true) {
      main.lr_btn.lighticon_off = loadImage("light-off-45x45.png");
      image(main.lr_btn.lighticon_off, 992, 270);
      image(main.lr_btn.lighticon_off, 752, 190);
      main.lr_btn.lighticon_off = loadImage("light-off-flip-45x45.png");
      image(main.lr_btn.lighticon_off, 772, 200);
    }
    // Hallway Lights - Off
    if (main.hr_btn.imgOver == true) {
      main.hr_btn.lighticon_off = loadImage("light-off-45x45.png");
      image(main.hr_btn.lighticon_off, 620, 250);
      main.hr_btn.lighticon_off = loadImage("light-off-flip-45x45.png");
      image(main.hr_btn.lighticon_off, 640, 260);
    }


    // Go Home Button
    if (main.gh_btn.imgOver == true) {
      if(main.isDark){
          main.sl_btn.rectOver = false;
          main.sl_btn.imgOver = false;
          main.al_btn.rectOver = false;
          main.al_btn.imgOver = false;
          main.ei_btn.rectOver = false;
          main.ei_btn.imgOver = false;
          main.vl_btn.rectOver = false;
          main.vl_btn.imgOver = false;
          main.ti_btn.rectOver = false;
          main.ti_btn.imgOver = false;
          main.am_btn.rectOver = false;
          main.am_btn.imgOver = false;
          main.gh_btn.imgOver = false;
          main.gh_btn.rectOver = false;

          main.kr_btn.imgOver = false;
          main.kr_btn.rectOver = false;
          main.br_btn.imgOver = false;
          main.br_btn.rectOver = false;
          main.bdr_btn.imgOver = false;
          main.bdr_btn.rectOver = false;
          main.lr_btn.imgOver = false;
          main.lr_btn.rectOver = false;
          main.hr_btn.imgOver = false;
          main.hr_btn.rectOver = false;
       //   main.clearHomeScreenDark();
       //   main.isDark = true;
      } else {
          main.sl_btn.rectOver = false;
          main.sl_btn.imgOver = false;
          main.al_btn.rectOver = false;
          main.al_btn.imgOver = false;
          main.ei_btn.rectOver = false;
          main.ei_btn.imgOver = false;
          main.vl_btn.rectOver = false;
          main.vl_btn.imgOver = false;
          main.ti_btn.rectOver = false;
          main.ti_btn.imgOver = false;
          main.am_btn.rectOver = false;
          main.am_btn.imgOver = false;
          main.gh_btn.imgOver = false;
          main.gh_btn.rectOver = false;

          main.kr_btn.imgOver = false;
          main.kr_btn.rectOver = false;
          main.br_btn.imgOver = false;
          main.br_btn.rectOver = false;
          main.bdr_btn.imgOver = false;
          main.bdr_btn.rectOver = false;
          main.lr_btn.imgOver = false;
          main.lr_btn.rectOver = false;
          main.hr_btn.imgOver = false;
          main.hr_btn.rectOver = false;
      }
   }
 
    // Audio Library
    // Play Button
    // if(main.play_btn1.imgOver == true){
    //     frank1.play(); 
    // }

    // Video Library
    // Pause Button
    // if(main.pause.imgOver == true){
    //     mov.stop(); 
    // }

    // Settings
    // Settings - Switch Button
    if(main.switch_btn.imgOver == true){   
        if(main.isDark){
          if(main.am_btn.imgOver == false){
            main.clearHomeScreen();
            main.displayMainMenuButtons();
          } else {
            main.clearHomeScreen();
            main.switch_btn.displaySwitchOn();
            main.isDark = false;
            main.gh_btn.displayHomeButton();
          }
        } else {
            main.clearHomeScreenDark();
            main.switch_btn.displaySwitchOn();
            main.isDark = true;
            main.gh_btn.displayHomeButton();
          }
    }
    // Display Settings (Light Mode)
    if(main.switch_btn.imgOver == true && main.am_btn.imgOver == true){   
        if(main.isDark){
          main.clearHomeScreen();
          main.switch_btn.displaySwitchOn();
          main.isDark = false;
          main.gh_btn.displayHomeButton();
        } 
        else {
          main.clearHomeScreenDark();
          main.switch_btn.displaySwitchOn();
          main.isDark = true;
          main.gh_btn.displayHomeButton();
        } 
    }
    // Display Smart Lights (Light Mode)
    if(main.switch_btn.imgOver == true && main.sl_btn.imgOver == true){   
      main.clearHomeScreen();
      main.isDark = false;
      main.displaySmartLights();
      main.gh_btn.displayHomeButton();
    }
    // Display Audio Library (Light Mode)
    if(main.switch_btn.imgOver == true && main.al_btn.imgOver == true){   
      main.clearHomeScreen();
      main.isDark = false;
      main.al_btn.displayAudioLibraryGrid();
      main.gh_btn.displayHomeButton();
    }
    // Display Email Inbox (Light Mode)
    if(main.switch_btn.imgOver == true && main.ei_btn.imgOver == true){   
      main.clearHomeScreen();
      main.isDark = false;
      main.displayEmailInbox();
      main.gh_btn.displayHomeButton();
    }
    // Display Video Library (Light Mode)
    if(main.switch_btn.imgOver == true && main.vl_btn.imgOver == true){   
      main.clearHomeScreen();
      main.isDark = false;
      main.vl_btn.displayVideoLibraryGrid();
      main.gh_btn.displayHomeButton();
    }
    // Display Text Inbox (Light Mode)
    if(main.switch_btn.imgOver == true && main.ti_btn.imgOver == true){   
      main.clearHomeScreen();
      main.isDark = false;
      main.displayTextInbox();
      main.gh_btn.displayHomeButton();
    }
    
}