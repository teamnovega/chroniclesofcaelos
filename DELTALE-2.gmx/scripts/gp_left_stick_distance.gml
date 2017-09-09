/// gp_left_stick_distance(player_id)
/// return left stick distance between 0, 0 and x, y
var controllerNumber = argument0;
var haxis = gamepad_axis_value(controllerNumber, gp_axislh);
var vaxis = gamepad_axis_value(controllerNumber, gp_axislv);
return point_distance(0, 0, haxis, vaxis);

