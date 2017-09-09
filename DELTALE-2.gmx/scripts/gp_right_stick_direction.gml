/// gp_right_stick_direction(player_id)
/// return right stick direction value between 0 and 360
var controllerNumber = argument0;
var haxis = gamepad_axis_value(controllerNumber, gp_axisrh);
var vaxis = gamepad_axis_value(controllerNumber, gp_axisrv);
return point_direction(0, 0, haxis, vaxis);

