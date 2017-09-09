/// iman_pressed(key, playerID)
/// returns true if mapped abstract key is pressed, either on the gamepad or the keyboard

if(keyboard_check_pressed(ds_map_find_value(iman_kb_map[argument1],argument0))) {
    iman_gp_used = true;
    return true;
}

if(gp_pressed(ds_map_find_value(iman_gp_map[argument1],argument0), argument1)) {
    iman_gp_used = false;
    return true;
}

return false;
