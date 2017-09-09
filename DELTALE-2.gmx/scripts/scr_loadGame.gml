/// scr_loadGame(save_file_number);
with (obj_playerStats) {
    // Get the save number
    var savefile = argument0;
    
    // Go to the room
    global.savedRoom = playerprefs_get("room_"+string(savefile));
    if (room != global.savedRoom) {
        room_goto(global.savedRoom);
    }
    
    // Player variables
    player_xstart = playerprefs_get("x_"+string(savefile));
    player_ystart = playerprefs_get("y_"+string(savefile));
    global.playerHP = playerprefs_get("hp_"+string(savefile));
    maxhp = playerprefs_get("maxhp_"+string(savefile));
    stamina = playerprefs_get("stamina_"+string(savefile));
    maxstamina = playerprefs_get("maxstamina_"+string(savefile));
    global.expr = playerprefs_get("expr_"+string(savefile));
    maxexpr = playerprefs_get("maxexpr_"+string(savefile));
    level = playerprefs_get("level_"+string(savefile));
    attack = playerprefs_get("attack_"+string(savefile));
    
    // HeartWing Data variables
    
    with (obj_heartWingHPController) {    
        global.heartWing[0] = getSpriteIndex("heartwing1_"+string(savefile));
        global.heartWingHP[0] = playerprefs_get("hwhp1_"+string(savefile));
        index[0] = playerprefs_get("hwindex1_"+string(savefile));
        
        global.heartWing[1] = getSpriteIndex("heartwing2_"+string(savefile));
        global.heartWingHP[1] = playerprefs_get("hwhp2_"+string(savefile));
        index[1] = playerprefs_get("hwindex2_"+string(savefile));
        
        global.heartWing[2] = getSpriteIndex("heartwing3_"+string(savefile));
        global.heartWingHP[2] = playerprefs_get("hwhp3_"+string(savefile));
        index[2] = playerprefs_get("hwindex3_"+string(savefile));
        
        global.heartWing[3] = getSpriteIndex("heartwing4_"+string(savefile));
        global.heartWingHP[3] = playerprefs_get("hwhp4_"+string(savefile));
        index[3] = playerprefs_get("hwindex4_"+string(savefile));
        
        global.heartWing[4] = getSpriteIndex("heartwing5_"+string(savefile));
        global.heartWingHP[4] = playerprefs_get("hwhp5_"+string(savefile));
        index[4] = playerprefs_get("hwindex5_"+string(savefile));
        
        global.heartWing[5] = getSpriteIndex("heartwing6_"+string(savefile));
        global.heartWingHP[5] = playerprefs_get("hwhp6_"+string(savefile));
        index[5] = playerprefs_get("hwindex6.5_"+string(savefile));
        
        global.heartWing[6] = getSpriteIndex("heartwing7_"+string(savefile));
        global.heartWingHP[6] = playerprefs_get("hwhp7_"+string(savefile));
        index[6] = playerprefs_get("hwindex7_"+string(savefile));
        
        global.heartWing[7] = getSpriteIndex("heartwing8_"+string(savefile));
        global.heartWingHP[7] = playerprefs_get("hwhp8_"+string(savefile));
        index[7] = playerprefs_get("hwindex8_"+string(savefile));

    }
    
    // Lighting Data variables
    
    with (obj_lightController) {
        daynight = playerprefs_get("lighting_daynight_"+string(savefile));
        red = playerprefs_get("lighting_rgbRed_"+string(savefile));
        green = playerprefs_get("lighting_rgbGreen_"+string(savefile));
        blue = playerprefs_get("lighting_rgbBlue_"+string(savefile));
        colour = make_colour_rgb(red,green,blue);
        global.outside = playerprefs_get("lighting_outside_"+string(savefile));
        brightness = playerprefs_get("lighting_brightness_"+string(savefile));
    }
}
