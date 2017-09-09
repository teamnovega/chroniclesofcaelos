/// gp_left_stick_down(player_id)
/// returns true if there is a change in the left stick axis vertically down

if(gamepad_axis_value(argument0, gp_axislv) > 0) {
    return true;
} else {
    return false;
}
