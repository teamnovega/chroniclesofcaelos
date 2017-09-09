/// gp_right_stick_distance(player_id)
/// return right stick distance between 0, 0 and x, y
var controllerNumber = argument0;
var haxis = gamepad_axis_value(controllerNumber, gp_axisrh);
var vaxis = gamepad_axis_value(controllerNumber, gp_axisrv);
return point_distance(0 ,0, haxis, vaxis);

