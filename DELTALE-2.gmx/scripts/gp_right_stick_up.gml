/// gp_right_stick_up(player_id)
/// returns true if there is a change in the right stick axis vertically up

if(gamepad_axis_value(argument0, gp_axisrv) < 0) {
    return true;
} else {
    return false;
}
