/// playerprefs_get(key [, default = undefined]);
/*
    Gets the value of the preference identified by key.
    If it doesn't exist, it will return the default value.
    
    Example: 
    
        var name = playerprefs_set("player_name");
        var health = playerprefs_set("health", 0);
        
        
*/

playerprefs_get_instance();
if (argument_count > 1) {
    if (!ds_map_exists(global._playerprefs_map, argument[0])) {
        return argument[1];
    }
}
return ds_map_find_value(global._playerprefs_map, argument[0]); 
