

//          Buttons
// -----------------------------------------
// Main Menu
// - Smart Lights Module

// - Video Player Module
// - Messaging




class Button {
    int b_width, b_height, b_x, b_y;
 
    int b_line_color, b_bg_color;
 
    void setButtonWidth(int w){ b_width = w; }
    void setButtonHeight(int h) { b_height = h; }
    void setButtonX(int x) { b_x = x; }
    void setButtonY(int y){ b_y = y; }
    void setLineColor(int clr){ b_line_color=clr; }
    void setBackgroundColor(int clr){ b_bg_color = clr; }

    void setButtonInfo(int w, int h, int x, int y){
        setButtonWidth(w);
        setButtonHeight(h);
        setButtonX(x);
        setButtonY(y);
    }

    void displayButton(){
        stroke(b_line_color);
        fill(b_bg_color);
        rect(b_x,b_y,b_width,b_height);
    }

    void displaySmartLightsButton(){
        setButtonInfo(500,500,0,0);

        stroke(0);      
        rect(b_x,b_y,b_width,b_height);

      
    }
  
}