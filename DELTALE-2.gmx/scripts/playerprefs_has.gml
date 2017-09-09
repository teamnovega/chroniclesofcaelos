/// playerprefs_has(key);
/*
    Returns true if key exists in the preferences.
    Example: 
    
        var first_play = playerprefs_has("first_play");
        if (!first_play) {
            show_message_async("Welcome to my super game!");
        }
        
        
*/

playerprefs_get_instance();
return ds_map_exists(global._playerprefs_map, argument0); 
