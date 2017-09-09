/// gp_down(gp_code, player_id)
/// returns true if a particular button mapped to the given code is held down
switch(argument0) {
    case IMAN_LEFT_STICK_UP: return gp_left_stick_up(argument1);
    case IMAN_LEFT_STICK_DOWN: return gp_left_stick_down(argument1);
    case IMAN_LEFT_STICK_LEFT: return gp_left_stick_left(argument1);
    case IMAN_LEFT_STICK_RIGHT: return gp_left_stick_right(argument1);
    case IMAN_RIGHT_STICK_UP: return gp_right_stick_up(argument1);
    case IMAN_RIGHT_STICK_DOWN: return gp_right_stick_down(argument1);
    case IMAN_RIGHT_STICK_LEFT: return gp_right_stick_left(argument1);
    case IMAN_RIGHT_STICK_RIGHT: return gp_right_stick_right(argument1);
    case IMAN_PAD_UP: return gp_pad_up(argument1);
    case IMAN_PAD_DOWN: return gp_pad_down(argument1);
    case IMAN_PAD_LEFT: return gp_pad_left(argument1);
    case IMAN_PAD_RIGHT: return gp_pad_right(argument1);
    case IMAN_BTN_A: return gp_button_a(argument1);
    case IMAN_BTN_B: return gp_button_b(argument1);
    case IMAN_BTN_X: return gp_button_x(argument1);
    case IMAN_BTN_Y: return gp_button_y(argument1);
    case IMAN_BTN_SELECT: return gp_button_select(argument1);
    case IMAN_BTN_START: return gp_button_start(argument1);
    case IMAN_BTN_STICK_LEFT: return gp_button_stick_left(argument1);
    case IMAN_BTN_STICK_RIGHT: return gp_button_stick_right(argument1);
    case IMAN_BTN_SHOULDER_LEFT: return gp_button_shoulder_left(argument1);
    case IMAN_BTN_SHOULDER_RIGHT: return gp_button_shoulder_right(argument1);
    case IMAN_BTN_TRIGGER_LEFT: return gp_button_trigger_left(argument1);
    case IMAN_BTN_TRIGGER_RIGHT: return gp_button_trigger_right(argument1);
}

return false;
