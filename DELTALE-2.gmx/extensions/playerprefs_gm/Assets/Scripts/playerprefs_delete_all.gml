/// playerprefs_delete_all();
/*
    Removes all keys and values from the preferences. Use with caution.
    Example: 
    
        if (show_question("Want to reset all the progress in the game?")) {
            playerprefs_delete_all();
            show_message("Progress erased");
        }
        
*/

playerprefs_get_instance();
global._playerprefs_changes = true;
ds_map_clear(global._playerprefs_map); 
return undefined;
