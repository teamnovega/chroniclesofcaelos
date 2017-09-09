///scr_enemy_wander_state
if(global.gP) exit;
if(global.speaking) exit;
scr_slime_check_for_player();
scr_slime_moveAxis();
