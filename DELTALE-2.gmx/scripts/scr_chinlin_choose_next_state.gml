///scr_slime_choose_next_state()
if(global.gP) exit;
if (alarm[0] <= 0) {
    chnState = choose(scr_chinlin_wander_state, scr_chinlin_idle_state);
    alarm[0] = room_speed*irandom_range(2,4);
    if (chnState == scr_chinlin_wander_state) {
        xaxis = random_range(-1,1);
        yaxis = random_range(-1,1);
    }
}
