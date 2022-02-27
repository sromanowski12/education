
// App Functions
Screen app = new Screen();
Screen main = new Screen();
Screen sl = new Screen();

int num;

void showHome(){
  if(main.isDark){
      main.displayHomeDark();
      
    } else {
      main.displayHome();
      
    }
}

// void showHome2(){
//     if(main.isDark){
//       main.displayHomeDark();
//     } else {
//       main.displayHome();
//     }
// }