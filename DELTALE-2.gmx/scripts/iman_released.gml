/// iman_released(key, playerID)
/// returns true if mapped abstract key is released, either on the gamepad or the keyboard

if(keyboard_check_released(ds_map_find_value(iman_kb_map[argument1],argument0))) {
    iman_gp_used = true;
    return true;
}

if(gp_released(ds_map_find_value(iman_gp_map[argument1],argument0), argument1)) {
    iman_gp_used = false;
    return true;
}

return false;
