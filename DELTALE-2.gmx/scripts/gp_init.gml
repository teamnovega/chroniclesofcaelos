/// gp_init(player_id)
/// inits a gamepad
global.gp[argument0] = true;
gamepad_set_axis_deadzone(argument0, iman_gp_deadZone);
