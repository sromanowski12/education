Movie mov;
boolean playing = false;
boolean stopped = false;

String PATH="Enterprise Quoting.mov";
String Blockers="Blockers.mp4";

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
      main.sl_btn.imgOver = true;
    } else {
      main.gh_btn.imgOver = true;
      main.sl_btn.imgOver = false;
    }
  }
  // Video library
  // Pause Button 
  if(main.pause.rectOver == true) {
    if(main.pause.imgOver == true) {
      main.pause.imgOver = false;
    } else {
      main.pause.imgOver = true;
    }
  }

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
  if ( overRect(main.al_btn.b_x, main.al_btn.b_y, (main.al_btn.b_size + 250),215) ) {
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
  if ( overRect(main.vl_btn.b_x, main.vl_btn.b_y, (main.vl_btn.b_size + 250),215) ) {
    main.vl_btn.rectOver = true;
  } else {
    main.vl_btn.rectOver = false;
  }
  // Text Messaging Button
  if ( overRect(main.ti_btn.b_x, main.ti_btn.b_y, (main.ti_btn.b_size + 250),215) ) {
    main.ti_btn.rectOver = true;
  } else {
    main.ti_btn.rectOver = false;
  }
    // Settings Button
  if ( overRect(main.am_btn.b_x, main.am_btn.b_y, (main.am_btn.b_size + 250),215) ) {
    main.am_btn.rectOver = true;
  } else {
    main.am_btn.rectOver = false;
  }

  // Smart Lights
  // Go Home Button
  if ( overRect(main.gh_btn.b_x, main.gh_btn.b_y, main.gh_btn.b_w,main.gh_btn.b_h)) {
    main.gh_btn.rectOver = true;
    main.sl_btn.rectOver = false;
  } else {
    main.gh_btn.rectOver = false;
   // main.sl_btn.rectOver = true;
  }
  
  // Video Library
  // Pause Button
  if ( overRect(main.pause.b_x, main.pause.b_y, (main.pause.b_size + 250),215) ) {
    main.pause.rectOver = true;
  } else {
    main.pause.rectOver = false;
  }

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

  // Main Menu
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
    // else {
    //     if(main.isDark){
    //       main.clearSmartLightsScreenDark();
    //     } else {
    //       main.clearSmartLightsScreen();
    //     }
    // }
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
        image(main.vl_btn.videoicon,400,50);  
        
        mov.play();
        
        playing = true;
        stopped = false;
        mov.speed(0);
        mov.volume(2);
        image(mov,0,0,width,height);

        main.displayVideoLibraryButtons();
    }
    // Text Messaging Button
    if (main.ti_btn.imgOver == true) {
      if(main.isDark){
          main.clearHomeScreenDark();
      } else {
          main.clearHomeScreen();
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

    // Smart Lights
    // Kitchen Button

    // Go Home Button
  //   if (main.gh_btn.imgOver == true) {
  //     if(main.isDark){
  //       main.sl_btn.rectOver = true;
  //       main.sl_btn.imgOver = true;
  //     }
  //  }
 
    // Video Library
    // Pause Button
    if(main.pause.imgOver == true){
        mov.stop(); 
    }

    // Settings
    // Settings Switch Button
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
}