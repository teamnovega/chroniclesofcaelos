/// scr_saveGame(save_file_number);

// Make sure the player exists
if (global.playerHP == 0) exit;

var savefile = argument0;

// Create the save data structure

with (obj_playerStats) {

    // System variables
    playerprefs_set("save_exists_"+string(savefile), 1);
    
    // Player variables
    playerprefs_set("room_"+string(savefile),global.previousRoom);
    
    if (instance_exists(obj_savePoint)) {
        savepoint = instance_nearest(global.savePointX, global.savePointY, obj_savePoint);
        playerprefs_set("x_"+string(savefile),savepoint.x);
        playerprefs_set("y_"+string(savefile),savepoint.y);
    } else {
        playerprefs_set("x_"+string(savefile),global.savePointX);
        playerprefs_set("y_"+string(savefile),global.savePointY);
    }
    
    playerprefs_set("maxhp_"+string(savefile) ,maxhp);
    playerprefs_set("stamina_"+string(savefile) ,stamina);
    playerprefs_set("maxstamina_"+string(savefile) ,maxstamina);
    playerprefs_set("expr_"+string(savefile) ,global.expr);
    playerprefs_set("maxexpr_"+string(savefile) ,maxexpr);
    playerprefs_set("level_"+string(savefile) ,level);
    playerprefs_set("attack_"+string(savefile) ,attack);
    
    // HeartWing Data Storage
    with (obj_heartWingHPController) {
        playerprefs_set("heartwing1_"+string(savefile), sprite_get_name(global.heartWing[0]));
            playerprefs_set("hwhp1_"+string(savefile), global.heartWingHP[0]);
            playerprefs_set("hwindex1_"+string(savefile), index[0]);
            
        playerprefs_set("heartwing2_"+string(savefile), sprite_get_name(global.heartWing[1]));
            playerprefs_set("hwhp2_"+string(savefile), global.heartWingHP[1]);
            playerprefs_set("hwindex2_"+string(savefile), index[1]);
            
        playerprefs_set("heartwing3_"+string(savefile), sprite_get_name(global.heartWing[2]));
            playerprefs_set("hwhp3_"+string(savefile), global.heartWingHP[2]);
            playerprefs_set("hwindex3_"+string(savefile), index[2]);
            
        playerprefs_set("heartwing4_"+string(savefile), sprite_get_name(global.heartWing[3]));
            playerprefs_set("hwhp4_"+string(savefile), global.heartWingHP[3]);
            playerprefs_set("hwindex4_"+string(savefile), index[3]);
            
        playerprefs_set("heartwing5_"+string(savefile), sprite_get_name(global.heartWing[4]));
            playerprefs_set("hwhp5_"+string(savefile), global.heartWingHP[4]);
            playerprefs_set("hwindex5_"+string(savefile), index[4]);
            
        playerprefs_set("heartwing6_"+string(savefile), sprite_get_name(global.heartWing[5]));
            playerprefs_set("hwhp6_"+string(savefile), global.heartWingHP[5]);
            playerprefs_set("hwindex6.5_"+string(savefile), index[5]);
            
        playerprefs_set("heartwing7_"+string(savefile), sprite_get_name(global.heartWing[6]));
            playerprefs_set("hwhp7_"+string(savefile), global.heartWingHP[6]);
            playerprefs_set("hwindex7_"+string(savefile), index[6]);
            
        playerprefs_set("heartwing8_"+string(savefile), sprite_get_name(global.heartWing[7]));
            playerprefs_set("hwhp8_"+string(savefile), global.heartWingHP[7]);
            playerprefs_set("hwindex8_"+string(savefile), index[7]);
        
        // Automatically save extra HeartWing slots
        if (array_length_1d(global.heartWing)-1 >= 8) {
            for (i=8; i>=array_length_1d(global.heartWing)-1; i++) {
                var hwi = "heartwing"+string(i+1)+"_"+string(savefile);
                var hwhpi = "hwhp"+string(i+1)+"_"+string(savefile);
                var hwini = "hwindex"+string(i+1)+"_"+string(savefile);
    
                playerprefs_set(hwi, sprite_get_name(global.heartWing[i]));
                    playerprefs_set(hwhpi, global.heartWingHP[i]);
                    playerprefs_set(hwini, index[i]);
            }
        }
            
        playerprefs_set("hp_"+string(savefile),global.playerHP);
    }
    
    // Lighting Data storage
    
    with (obj_lightController) {
        playerprefs_set("lighting_daynight_"+string(savefile), daynight);
        playerprefs_set("lighting_rgbRed_"+string(savefile), red);
        playerprefs_set("lighting_rgbGreen_"+string(savefile), green);
        playerprefs_set("lighting_rgbBlue_"+string(savefile), blue);
        playerprefs_set("lighting_outside_"+string(savefile), global.outside);
        playerprefs_set("lighting_brightness_"+string(savefile), brightness);
    }
    
    playerprefs_save();
}
show_message("Game Saved");
