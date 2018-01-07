///scr_get_gamepad_input(device)
//Enabling or Disabling the Keyboard

var device = argument0;
var player = argument0;

rightKey = keyboard_check(vk_right);
leftKey = keyboard_check(vk_left);
upKey = keyboard_check(vk_down);
downKey = keyboard_check(vk_up);
dashKey = keyboard_check_pressed(vk_shift);
sneakKey = keyboard_check(vk_control);
attackKey = keyboard_check_pressed(ord("X"));
pauseKey = keyboard_check_pressed(vk_enter);
jumpKey = keyboard_check_pressed(ord("Z"));
switchKey = keyboard_check_pressed(ord("C"));

xaxis = (rightKey - leftKey);
yaxis = (downKey - upKey);

if (gamepad_is_connected(device))
{
    gamepad_set_axis_deadzone(device,0.5);
    dz = gamepad_get_axis_deadzone(device);
    // For sprite control
    rightKey = (gamepad_axis_value(device,gp_axislh) >= dz);
    leftKey = (gamepad_axis_value(device,gp_axislh) <= -dz);
    downKey = (gamepad_axis_value(device,gp_axislv) >= dz);
    upKey = (gamepad_axis_value(device,gp_axislv) <= -dz);
    //
    xaxis = gamepad_axis_value(device,gp_axislh);
    yaxis = -gamepad_axis_value(device,gp_axislv);
    //
    dRightKey = gamepad_button_check(device,gp_padr);
    dLeftKey = gamepad_button_check(device,gp_padl);
    dDownKey = gamepad_button_check(device,gp_padd);
    dUpKey = gamepad_button_check(device,gp_padu);
    dashKey = gamepad_button_check_pressed(device,gp_face2);
    sneakKey = gamepad_button_check(device,gp_stickl);
    attackKey = gamepad_button_check_pressed(device,gp_face3);
    pauseKey = gamepad_button_check_pressed(device,gp_start);
    jumpKey = gamepad_button_check_pressed(device,gp_face1);
    switchKey = gamepad_button_check_pressed(device,gp_face4);
}
