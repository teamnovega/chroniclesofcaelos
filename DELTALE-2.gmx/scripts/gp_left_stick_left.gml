/// gp_left_stick_left(player_id)
/// returns true if there is a change in the left stick axis towards left

if(gamepad_axis_value(argument0, gp_axislh) < 0) {
    return true;
} else {
    return false;
}
