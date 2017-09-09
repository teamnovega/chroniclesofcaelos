/// iman_down(key, playerID)
/// returns true if mapped abstract key is held down, either on the gamepad or the keyboard

if(gp_down(ds_map_find_value(iman_gp_map[argument1],argument0), argument1)) {
    iman_gp_used[argument1] = true;
    return true;
}

if(keyboard_check(ds_map_find_value(iman_kb_map[argument1],argument0))) {
    iman_gp_used[argument1] = false;
    return true;
}

return false;
