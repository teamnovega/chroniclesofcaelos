/// scr_menuMove();

switch(gamepad_is_connected(0)) {
    case true:
        if (alarm[0] <= 0) {
            if (downKey) or (dDownKey) {
                menuOption += 1;
                if (menuOption > (array_length_1d(menu)-1)) {
                    menuOption = 0;
                }
                audio_play_sound(snd_menuScroll,1,false);
                alarm[0] = room_speed/7;
            }
            
            if (upKey) or (dUpKey) {
                menuOption -= 1;
                if (menuOption < 0) {
                    menuOption = array_length_1d(menu)-1;
                }
                audio_play_sound(snd_menuScroll,1,false);
                alarm[0] = room_speed/7;
            }
        }
        break;
        
    case false:
        if (alarm[0] <= 0) {
            if (upKey) {
                menuOption += 1;
                if (menuOption > (array_length_1d(menu)-1)) {
                    menuOption = 0;
                }
                audio_play_sound(snd_menuScroll,1,false);
                alarm[0] = room_speed/7;
            }
            
            if (downKey) {
                menuOption -= 1;
                if (menuOption < 0) {
                    menuOption = array_length_1d(menu)-1;
                }
                audio_play_sound(snd_menuScroll,1,false);
                alarm[0] = room_speed/7;
            }
        }
        break;
}
