/// gp_right_stick_left(player_id)
/// returns true if there is a change in the right stick axis towards left

if(gamepad_axis_value(argument0, gp_axisrh) < 0) {
    return true;
} else {
    return false;
}
