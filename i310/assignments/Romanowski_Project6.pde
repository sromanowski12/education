// Seth Romanowski
// INFO-I 310
// Project 6

// -----------------------------------------
//           Screen Numbers
// -----------------------------------------
// 1. Main Menu     | 2. Main Menu (Dark)
// 3. Smart Lights  | 4. Smart Lights (Dark)
// 5. Audio Player  | 6. Audio Player (Dark)
// 7. Email         | 8. Email (Dark)
// 9. Video Player  | 10. Video Player (Dark)
// 11. Text Msg     | 12. Text Msg (Dark)
// 13. Settings     | 14. Settings (Dark)

// --------------------------------------------------------------------------------------
//     Screen      |             Buttons             |       Screen     |     Buttons
// --------------------------------------------------------------------------------------
// 1. Main Menu /  | 1. Smart Lights Button          | 3. Smart Lights /| 1. Living Room
// 2. Main Menu    | 2. Audio Library Button         | 4. Smart Lights  | 2. Kitchen
//    (Dark)       | 3. Email Inbox Button           |    (Dark)        | 3. Bathroom
//                 | 4. Video Library Button         |                  | 4. Bedroom
//                 | 5. Text Messaging Inbox Button  |
//                 | 6. Settings Button              |
// 5. Main Menu    | 1. Smart Lights Button          | 7. Smart Lights  | 1. Living Room
// 6.              | 2. Audio Library Button         | 8.
//                 | 3. Email Inbox Button           |
//                 | 4. Video Library Button         |
//                 | 5. Text Messaging Inbox Button  |
//                 | 6. Settings Button              |
// 9. Main Menu    | 1. Smart Lights Button          | 11. Smart Lights  | 1. Living Room
// 10.             | 2. Audio Library Button         | 12.
//                 | 3. Email Inbox Button           |
//                 | 4. Video Library Button         |
//                 | 5. Text Messaging Inbox Button  |
//                 | 6. Settings Button              |
// 13. Main Menu   | 1. Smart Lights Button          | 11. Smart Lights  | 1. Living Room
// 14.             | 2. Audio Library Button         | 12.
//                 | 3. Email Inbox Button           |
//                 | 4. Video Library Button         |
//                 | 5. Text Messaging Inbox Button  |
//                 | 6. Settings Button              |

import processing.video.*;
import processing.sound.*;

Screen app = new Screen();

void setup() {
  size(1080, 600);
  frameRate(30);
  mov = new Movie(this, PATH);
}

void draw() {
  app.displayHomeDark();
  update(mouseX,mouseY);
  checkButtons();
}