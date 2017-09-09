/// playerprefs_system_init();
/**
    Call this script at the create event of the obj_playerprefs
    
    Example:
        // create event obj_playerprefs
        if (singleton()) exit;
        playerprefs_system_init();
*/

global._playerprefs_filename = "playerprefs.sav"; //Change this if you like

// ======= DO not change this =============
global._playerprefs_changes = false;

if (file_exists(global._playerprefs_filename)) {
    global._playerprefs_map = ds_map_secure_load(global._playerprefs_filename);
} else {
    global._playerprefs_map = ds_map_create();
}



