
// App Functions
Screen app = new Screen();
Screen main = new Screen();
Screen sl = new Screen();

// void showHome(){
//   if(app.isDark){
//       app.displayHomeDark();
//     } else {
//       app.displayHome();
//     }
// }

void showHome2(){
    if(main.isDark){
      main.displayHomeDark();
    } else {
      main.displayHome();
    }
}

void showSL(){
    sl.displaySmartLightsDark();
}