/// gp_inputManager_system
/// system event handler

var et = ds_map_find_value(async_load, "event_type");
var pad_index = -1;

if(et == "gamepad discovered") {
    pad_index = ds_map_find_value(async_load, "pad_index");
    if(pad_index != -1) {
        gp_init(pad_index);
        
        iman_gp_last_found = pad_index;
        event_perform(ev_other, ev_user1);
    }
    
}

if(et == "gamepad lost") {
    pad_index = ds_map_find_value(async_load, "pad_index");
    if(pad_index != -1) {
        iman_gp[pad_index] = false;
        
        iman_gp_last_lost = pad_index;
        event_perform(ev_other, ev_user0);
    }
}
