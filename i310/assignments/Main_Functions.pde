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
  if (app.sl_btn.rectOver == true) { 
    if (app.sl_btn.imgOver == true) { 
      app.sl_btn.imgOver = false;
    } else {
      app.sl_btn.imgOver = true;
    }
  }
  // Audio Library Button
  if (app.al_btn.rectOver2 == true) { 
    if (app.al_btn.imgOver2 == true) { 
      app.al_btn.imgOver2 = false;
    } else {
      app.al_btn.imgOver2 = true;
    }
  }
  // Email Inbox Button
  if (app.ei_btn.rectOver3 == true) { 
    if (app.ei_btn.imgOver3 == true) { 
      app.ei_btn.imgOver3 = false;
    } else {
      app.ei_btn.imgOver3 = true;
    }
  }
  // Video library Button
  if (app.vl_btn.rectOver4 == true) {
    if (app.vl_btn.imgOver4 == true) { 
      app.vl_btn.imgOver4 = false;
    } else {
      app.vl_btn.imgOver4 = true;
    }
  }
  // Text Messaging Button
  if (app.ti_btn.rectOver5 == true) { 
    if (app.ti_btn.imgOver5 == true) { 
      app.ti_btn.imgOver5 = false;
    } else {
      app.ti_btn.imgOver5 = true;
    }
  }
  // Settings Button
  if (app.am_btn.rectOver6 == true) { 
    if (app.am_btn.imgOver6 == true) { 
      app.am_btn.imgOver6 = false;
    } else {
      app.am_btn.imgOver6 = true;
    }
  }
  // Smart Lights
  // Go Home Button
  if(app.gh_btn.rectOver7 == true) {
    if(app.gh_btn.imgOver7 == true) {
      app.gh_btn.imgOver7 = false;
    } else {
      app.gh_btn.imgOver7 = true;
    }
  }
  // Video library
  // Pause Button 
  if(app.pause.rectOver8 == true) {
    if(app.pause.imgOver8 == true) {
      app.pause.imgOver8 = false;
    } else {
      app.pause.imgOver8 = true;
    }
  }

}

void update(int x, int y) { 
  // Main Menu
  // Smart Lights Button
  if ( overRect(app.sl_btn.b_x, app.sl_btn.b_y, (app.sl_btn.b_size + 250),215) ) {
    app.sl_btn.rectOver = true;
  } else {
    app.sl_btn.rectOver = false;

  }
  // Audio Library Button
  if ( overRect(app.al_btn.b_x, app.al_btn.b_y, (app.al_btn.b_size + 250),215) ) {
    app.al_btn.rectOver2 = true;
  } else {
    app.al_btn.rectOver2 = false;
  }
  // Email Inbox Button
  if ( overRect(app.ei_btn.b_x, app.ei_btn.b_y, (app.ei_btn.b_size + 250),215) ) {
    app.ei_btn.rectOver3 = true;
  } else {
    app.ei_btn.rectOver3 = false;
  }
  // Video Library Button
  if ( overRect(app.vl_btn.b_x, app.vl_btn.b_y, (app.vl_btn.b_size + 250),215) ) {
    app.vl_btn.rectOver4 = true;
  } else {
    app.vl_btn.rectOver4 = false;
  }
  // Text Messaging Button
  if ( overRect(app.ti_btn.b_x, app.ti_btn.b_y, (app.ti_btn.b_size + 250),215) ) {
    app.ti_btn.rectOver5 = true;
  } else {
    app.ti_btn.rectOver5 = false;
  }
    // Settings Button
  if ( overRect(app.am_btn.b_x, app.am_btn.b_y, (app.am_btn.b_size + 250),215) ) {
    app.am_btn.rectOver6 = true;
  } else {
    app.am_btn.rectOver6 = false;
  }
  // Smart Lights
  // Go Home Button
  if ( overRect(app.gh_btn.b_x, app.gh_btn.b_y, (app.gh_btn.b_size + 250),215) ) {
    app.gh_btn.rectOver7 = true;
  } else {
    app.gh_btn.rectOver7 = false;
  }
  
  // Video Library
  // Pause Button
  if ( overRect(app.pause.b_x, app.pause.b_y, (app.pause.b_size + 250),215) ) {
    app.pause.rectOver8 = true;
  } else {
    app.pause.rectOver8 = false;
  }

}




// Button Actions
void checkButtons(){

  // Main Menu
  // Smart Lights Button
    if (app.sl_btn.imgOver == true) {
       
        if(app.isDark){
            app.clearHomeScreenDark();
            app.displaySmartLightsButtons();

        } else {
            app.clearHomeScreen();
            app.displaySmartLightsButtons();
        }
    }  
    // else {
    //     if(app.isDark){
    //       app.clearSmartLightsScreenDark();
    //     } else {
    //       app.clearSmartLightsScreen();
    //     }
    // }
    // Audio Library Button
    else if (app.al_btn.imgOver2 == true) {
        if(app.isDark){
            app.clearHomeScreenDark();
            app.displayAudioLibraryDark();
            
        } else {
            app.clearHomeScreen();
        }
    }
    // Email Inbox Button
    else if (app.ei_btn.imgOver3 == true) {
        if(app.isDark){
            app.clearHomeScreenDark();
            app.displayEmailInbox();
        } else {
            app.clearHomeScreen();
        }
    }
    // Video Library Button
    else if (app.vl_btn.imgOver4 == true) {
        image(app.vl_btn.videoicon,400,50);  
        
        mov.play();
        
        playing = true;
        stopped = false;
        mov.speed(0);
        mov.volume(2);
        image(mov,0,0,width,height);

        app.displayVideoLibraryButtons();
    }
    // Text Messaging Button
    else if (app.ti_btn.imgOver5 == true) {
      if(app.isDark){
          app.clearHomeScreenDark();
      } else {
          app.clearHomeScreen();
      }
    }
    // Settings Button
    else if (app.am_btn.imgOver6 == true) {
      if(app.isDark){
          app.clearHomeScreenDark();
      } else {
          app.clearHomeScreen();
      }
    }
    // Smart Lights
    // Kitchen Button

    // Go Home Button
    if (app.gh_btn.imgOver7 == true) {
      if(app.isDark){
        app.sl_btn.rectOver = true;
        app.sl_btn.imgOver = true;
      }
   }
 
    // Video Library
    // Pause Button
    if(app.pause.imgOver8 == true){
           mov.stop(); 
    }


}