/// playerprefs_set(key, value);
/*
    Sets the value of the preference identified by key.
    Example: 
    
        playerprefs_set("player_name", "Ciberman");
        playerprefs_set("health", 58);
        
        
*/

playerprefs_get_instance();
global._playerprefs_changes = true;
ds_map_set(global._playerprefs_map, argument0, argument1); 
