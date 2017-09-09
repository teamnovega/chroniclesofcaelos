/// gp_vibration_start(player_id, time - steps, vibAmount_left - 0 to 1, vibAmount_left 0 to 1)
/// adds a vibration object to the room and vibrates the current player_id controller for number of steps with given value for left and right motors
gamepad_set_vibration(argument0, argument2, argument3);

with(instance_create(0,0,obj_gp_vibrate_timeout)) {
    gp_vibrate_target = argument0;
    alarm[0] = argument1;
}
