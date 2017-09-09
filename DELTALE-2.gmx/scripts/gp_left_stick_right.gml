/// gp_left_stick_right(player_id)
/// returns true if there is a change in the left stick axis towards right

if(gamepad_axis_value(argument0, gp_axislh) > 0) {
    return true;
} else {
    return false;
}
