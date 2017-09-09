/// scr_menuSelect(setting);
setting = argument0;

switch (setting) {
    case "main menu":
            switch(menuOption) {
                case 0:
                    // Continue
                    if (playerprefs_has("save_exists_1")) {
                        room_goto(rm_loadingScreen);
                    }
                    break;
                case 1:
                    // New Game
                    room_goto(rm_terrainTest);
                    break;
                case 2:
                    // Options
                    // room_goto(rm_optionsMenu);
                    room_goto(rm_options);
                    break;
                case 3:
                    // Quit
                    game_end();
                    break;
                default:
                    show_error("Error: Invalid menu option! #Please contact VEGACIDE at vegacide@gmail.com.",true);
                    break;
            }
        break;
        
    case "options":
            switch(menuOption) {
                case 0:
                    // Audio
                    room_goto(rm_audio);
                    break;
                case 1:
                    // Video
                    // go to video room
                    break;
                case 2:
                    // Credits
                    room_goto(rm_credits);
                    break;
                case 3:
                    // Back
                    room_goto(rm_menu);
                    break;
                default:
                    show_error("Error: Invalid menu option! Aborting game.",true);
                    break;
            }
        break;
        
    case "audio":
            switch(menuOption) {
                case 0:
                    // Master VOL
                    break;
                case 1:
                    // Music VOL
                    break;
                case 2:
                    // SFX VOL
                    break;
                case 3:
                    // Reset to Defaults
                    global.masterGain = 0.4;
                    global.musicGain = 0.8;
                    global.sfxGain = 0.3;
                    break;
                case 4:
                    // Back
                    room_goto(rm_options);
                    audio_play_sound(snd_menuSelect,1,false);
                    break;
                default:
                    show_error("Error: Invalid menu option! Aborting game.",true);
                    break;
            }
        break;
        
    default:
        show_error("Error: scr_menuSelect setting is invalid! Aborting game.",true);
        break;
}
