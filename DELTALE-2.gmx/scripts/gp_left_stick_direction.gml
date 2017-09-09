/// gp_left_stick_direction(player_id)
/// return left sick direction value between 0 and 360
var controllerNumber = argument0;
var haxis = gamepad_axis_value(controllerNumber, gp_axislh);
var vaxis = gamepad_axis_value(controllerNumber, gp_axislv);
return point_direction(0, 0, haxis, vaxis);

