/// playerprefs_delete(key);
/*
    Removes key and its corresponding value from the preferences and returns undefined.
    Example: 
    
        if (show_question("Want to remove all the progress in this level?")) {
            level_12_score = playerprefs_delete("level_12_score");
            show_message("Progress of the level 12 erased");
        }
        
*/

playerprefs_get_instance();
global._playerprefs_changes = true;
ds_map_delete(global._playerprefs_map, argument0); 
return undefined;
