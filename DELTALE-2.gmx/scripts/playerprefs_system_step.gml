/// playerprefs_system_step();
/**
    Call this in the step event of the obj_playerprefs
*/

if (os_is_paused()) {
    show_debug_message("Game is paused.");
}
