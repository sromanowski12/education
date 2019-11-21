Movie mov;
boolean playing = false;
boolean stopped = false;
String PATH="Enterprise Quoting.mov";
String Blockers="Blockers.mp4";


// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}






void mousePressed() {
  if(app.pause.rectOver == true) {
    if(app.pause.imgOver == true) {
      app.pause.imgOver = false;
    } else {
      app.pause.imgOver = true;
    }
  }
  
  
  if (app.sl_btn.rectOver == true) { //if the rectOver boolean is currently true && the mouse is pressed then:
    if (app.sl_btn.imgOver == true) { 
      app.sl_btn.imgOver = false;
    } else {
      app.sl_btn.imgOver = true;
    }
  }
  if (app.al_btn.rectOver == true) { //if the rectOver boolean is currently true && the mouse is pressed then:
    if (app.al_btn.imgOver == true) { 
      app.al_btn.imgOver = false;
    } else {
      app.al_btn.imgOver = true;
    }
  }
  if (app.ei_btn.rectOver == true) { //if the rectOver boolean is currently true && the mouse is pressed then:
    if (app.ei_btn.imgOver == true) { 
      app.ei_btn.imgOver = false;
    } else {
      app.ei_btn.imgOver = true;
    }
  }
  if (app.vl_btn.rectOver == true) { //if the rectOver boolean is currently true && the mouse is pressed then:
    if (app.vl_btn.imgOver == true) { 
      app.vl_btn.imgOver = false;
    } else {
      app.vl_btn.imgOver = true;
    }
  }
  if (app.ti_btn.rectOver == true) { //if the rectOver boolean is currently true && the mouse is pressed then:
    if (app.ti_btn.imgOver == true) { 
      app.ti_btn.imgOver = false;
    } else {
      app.ti_btn.imgOver = true;
    }
  }
}

void update(int x, int y) { //implements the highlight over the 'imgSw31'
  if ( overRect(app.pause.b_x, app.pause.b_y, (app.pause.b_size + 250),215) ) {
    app.pause.rectOver = true;
  } else {
    app.pause.rectOver = false;
  }
  
  if ( overRect(app.sl_btn.b_x, app.sl_btn.b_y, (app.sl_btn.b_size + 250),215) ) {
    app.sl_btn.rectOver = true;
  } else {
    app.sl_btn.rectOver = false;
  }
  if ( overRect(app.al_btn.b_x, app.al_btn.b_y, (app.al_btn.b_size + 250),215) ) {
    app.al_btn.rectOver = true;
  } else {
    app.al_btn.rectOver = false;
  }
  if ( overRect(app.ei_btn.b_x, app.ei_btn.b_y, (app.ei_btn.b_size + 250),215) ) {
    app.ei_btn.rectOver = true;
  } else {
    app.ei_btn.rectOver = false;
  }
  if ( overRect(app.vl_btn.b_x, app.vl_btn.b_y, (app.vl_btn.b_size + 250),215) ) {
    app.vl_btn.rectOver = true;
  } else {
    app.vl_btn.rectOver = false;
  }
  if ( overRect(app.ti_btn.b_x, app.ti_btn.b_y, (app.ti_btn.b_size + 250),215) ) {
    app.ti_btn.rectOver = true;
  } else {
    app.ti_btn.rectOver = false;
  }
  

}

boolean overRect(int x, int y, int width, int height) { //measures the location of the mouse and compaires it to the location of the imgSw31.
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}


// Button Actions
void checkButtons(){
  // Smart Lights
 
    if (app.sl_btn.imgOver == true) {
        // image(app.al_btn.homeicon,400,50);
        if(app.isDark){
            app.clearScreenDark();
            app.setScreenNumber(4);
            app.displaySmartLightsButtons();
        } else {
            app.clearScreen();
            app.setScreenNumber(3);
            app.displaySmartLightsButtons();
        }
    }   
 
    // Music Library
    
    if (app.al_btn.imgOver == true) {
        // image(app.al_btn.musicicon,400,50);
        if(app.isDark){
            app.clearScreenDark();
        } else {
            app.clearScreen();
        }

    }

    // Email
    if (app.ei_btn.imgOver == true) {
        // image(app.al_btn.musicicon,400,50);
        if(app.isDark){
            app.clearScreenDark();
        } else {
            app.clearScreen();
        }
    }
    
    // Video Library
    if (app.vl_btn.imgOver == true) {
        
   //     app.play.setButtonInfo(540,525,75,75);
   //     app.pause.pauseicon = loadImage("pause-icon.png");
   //     app.play.playicon = loadImage("play-icon.png");
        image(app.vl_btn.videoicon,400,50);  
        
          mov.play();
        
        playing = true;
        stopped = false;
        mov.speed(0);
        mov.volume(2);
        image(mov,0,0,width,height);
    //    image(app.pause.pauseicon,540,525);
        app.displayVideoLibraryButtons();

    }
    
    if(app.pause.imgOver == true){
           mov.stop(); 
    }

    // Text Messaging
    if (app.ti_btn.imgOver == true) {
        if(app.isDark){
            app.clearScreenDark();
        } else {
            app.clearScreen();
        }
    //  image(app.ti_btn.homeicon,400,50);
    }
    // Settings
    if (app.am_btn.imgOver == true) {
        if(app.isDark){
            app.clearScreenDark();
        } else {
            app.clearScreen();
        }
    //  image(app.ti_btn.homeicon,400,50);
    }
 
 
 if(app.s_number == 3 || app.s_number == 4){

 }


}