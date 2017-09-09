/// playerprefs_save();
/*
    Writes all modified preferences to disk.

    By default Unity writes preferences to disk during OnApplicationQuit(). 
    In cases when the game crashes or otherwise prematuraly exits, you might 
    want to write the PlayerPrefs at sensible 'checkpoints' in your game. 
    This function will write to disk potentially causing a small hiccup, 
    therefore it is not recommended to call during actual gameplay.
    
    Note: There is no need to call this function manually inside game end event.
    
    Note: On mobile platforms preferences are saved during 
    application suspend, because there's no game end event.
        
        
*/
//playerprefs_get_instance();
if (global._playerprefs_changes) {
    ds_map_secure_save(global._playerprefs_map, global._playerprefs_filename);
    global._playerprefs_changes = false;
}
