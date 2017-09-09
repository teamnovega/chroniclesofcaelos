/// gp_inputManager_init()
/// InputMan - InputManager Init

// global player IDs
globalvar IMAN_P1;
globalvar IMAN_P2;
globalvar IMAN_P3;
globalvar IMAN_P4;
IMAN_P1 = 0;
IMAN_P2 = 1;
IMAN_P3 = 2;
IMAN_P4 = 3;

globalvar IMAN_LEFT_STICK_UP;
globalvar IMAN_LEFT_STICK_DOWN;
globalvar IMAN_LEFT_STICK_LEFT;
globalvar IMAN_LEFT_STICK_RIGHT;
globalvar IMAN_RIGHT_STICK_UP;
globalvar IMAN_RIGHT_STICK_DOWN;
globalvar IMAN_RIGHT_STICK_LEFT;
globalvar IMAN_RIGHT_STICK_RIGHT;
globalvar IMAN_PAD_UP;
globalvar IMAN_PAD_DOWN;
globalvar IMAN_PAD_LEFT;
globalvar IMAN_PAD_RIGHT;
globalvar IMAN_BTN_A;
globalvar IMAN_BTN_B;
globalvar IMAN_BTN_X;
globalvar IMAN_BTN_Y;
globalvar IMAN_BTN_SELECT;
globalvar IMAN_BTN_START;
globalvar IMAN_BTN_STICK_LEFT;
globalvar IMAN_BTN_STICK_RIGHT;
globalvar IMAN_BTN_SHOULDER_LEFT;
globalvar IMAN_BTN_SHOULDER_RIGHT;
globalvar IMAN_BTN_TRIGGER_LEFT;
globalvar IMAN_BTN_TRIGGER_RIGHT;

IMAN_LEFT_STICK_UP = 420;
IMAN_LEFT_STICK_DOWN = 421;
IMAN_LEFT_STICK_LEFT = 422;
IMAN_LEFT_STICK_RIGHT = 423;
IMAN_RIGHT_STICK_UP = 424;
IMAN_RIGHT_STICK_DOWN = 425;
IMAN_RIGHT_STICK_LEFT = 426;
IMAN_RIGHT_STICK_RIGHT = 427;
IMAN_PAD_UP = gp_padu;
IMAN_PAD_DOWN = gp_padd;
IMAN_PAD_LEFT = gp_padl;
IMAN_PAD_RIGHT = gp_padr;
IMAN_BTN_A = gp_face1;
IMAN_BTN_B = gp_face2;
IMAN_BTN_X = gp_face3;
IMAN_BTN_Y = gp_face4;
IMAN_BTN_SELECT = gp_select;
IMAN_BTN_START = gp_start;
IMAN_BTN_STICK_LEFT = gp_stickl;
IMAN_BTN_STICK_RIGHT = gp_stickr;
IMAN_BTN_SHOULDER_LEFT = gp_shoulderl;
IMAN_BTN_SHOULDER_RIGHT = gp_shoulderr;
IMAN_BTN_TRIGGER_LEFT = gp_shoulderlb;
IMAN_BTN_TRIGGER_RIGHT = gp_shoulderrb;

// keyboard maps
globalvar iman_kb_map;
iman_kb_map[IMAN_P1] = ds_map_create();
iman_kb_map[IMAN_P2] = ds_map_create();
iman_kb_map[IMAN_P3] = ds_map_create();
iman_kb_map[IMAN_P4] = ds_map_create();

/// Gamepads Init

// is gamepad supported
globalvar iman_gp_supported;
iman_gp_supported = gamepad_is_supported();

globalvar iman_gp_used;
iman_gp_used[IMAN_P1] = false;
iman_gp_used[IMAN_P2] = false;
iman_gp_used[IMAN_P3] = false;
iman_gp_used[IMAN_P4] = false;

// number of gamepads
globalvar iman_gp_count;
iman_gp_count = 0;

// active gamepads
globalvar iman_gp;
iman_gp[IMAN_P1] = false;
iman_gp[IMAN_P2] = false;
iman_gp[IMAN_P3] = false;
iman_gp[IMAN_P4] = false;

// deadZone Value for all controllers axes
globalvar iman_gp_deadZone;
iman_gp_deadZone = 0.5;

// map to store values
globalvar iman_gp_map;
iman_gp_map[IMAN_P1] = ds_map_create();
iman_gp_map[IMAN_P2] = ds_map_create();
iman_gp_map[IMAN_P3] = ds_map_create();
iman_gp_map[IMAN_P4] = ds_map_create();

// index of the last lost gamepad
globalvar iman_gp_last_lost;
iman_gp_last_lost = -1;

globalvar iman_gp_last_found;
iman_gp_last_found = -1;

// look for active gamepads
if(iman_gp_supported) {
    iman_gp_count = gamepad_get_device_count();
    var i;
    for(i=0;i<4;i++) {
        if(gamepad_is_connected(i) == true) {
            gp_init(i);
        }
    }
}
