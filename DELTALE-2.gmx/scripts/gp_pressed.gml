/// gp_pressed(gp_code, player_id)
/// returns true if a particular gamepad button mapped to the given code is pressed

switch(argument0) {
    case IMAN_PAD_UP: return gp_pad_up_pressed(argument1);
    case IMAN_PAD_DOWN: return gp_pad_down_pressed(argument1);
    case IMAN_PAD_LEFT: return gp_pad_left_pressed(argument1);
    case IMAN_PAD_RIGHT: return gp_pad_right_pressed(argument1);
    case IMAN_BTN_A: return gp_button_a_pressed(argument1);
    case IMAN_BTN_B: return gp_button_b_pressed(argument1);
    case IMAN_BTN_X: return gp_button_x_pressed(argument1);
    case IMAN_BTN_Y: return gp_button_y_pressed(argument1);
    case IMAN_BTN_SELECT: return gp_button_select_pressed(argument1);
    case IMAN_BTN_START: return gp_button_start_pressed(argument1);
    case IMAN_BTN_STICK_LEFT: return gp_button_stick_left_pressed(argument1);
    case IMAN_BTN_STICK_RIGHT: return gp_button_stick_right_pressed(argument1);
    case IMAN_BTN_SHOULDER_LEFT: return gp_button_shoulder_left_pressed(argument1);
    case IMAN_BTN_SHOULDER_RIGHT: return gp_button_shoulder_right_pressed(argument1);
    case IMAN_BTN_TRIGGER_LEFT: return gp_button_trigger_left_pressed(argument1);
    case IMAN_BTN_TRIGGER_RIGHT: return gp_button_trigger_right_pressed(argument1);
}

return false;
