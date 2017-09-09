///scr_enemy_stall_state()
if(global.gP) exit;
movement = IDLE;
if (alarm[1] <= 0)
{
    chnState = scr_chinlin_idle_state;
}
