///scr_move_state(deadzone,spd,device)
if(global.gP) exit;
scr_get_gamepad_input(0);
movement = MOVE;

if global.isDashing = true {global.isDashing = false};
var burntout = 0;
var gotcha = argument0;
var threshold = 0.5; //Deadzone
var device = argument2; //Get device - default is 0
// Normalize Gamepad Movement
if (gamepad_is_connected(device)) {
    var spd = argument1*1.25;
    gamepad_set_axis_deadzone(device,threshold);
} else {
    var spd = argument1;
}
//
var magnitude = point_distance(0,0,xaxis,yaxis); //Get distance from center
var dir = point_direction(0,0,xaxis,yaxis); //Get direction

// Jumping 
global.zspd += zgrav;
global.z += global.zspd;
if (global.z>zground) //to be replaced with ground height value later
{
    global.z = zground;
    global.zspd = 0;
    jumping = 0;
}
if (global.z>zground) and (jumping == 1) {
    gamepad_set_vibration(0,0.25,0.25);
    alarm[3] = room_speed/8;
}
if (jumpKey) {
    var xdir = lengthdir_x(8, facing*90);
    var ydir = lengthdir_y(8, facing*90);
    var speaker = instance_place(x+xdir,y+ydir,obj_speaker);
    if (speaker != noone) 
        {
            // Talk to it
            scr_speak();
        }
    else 
    if (!instance_exists(obj_dialog)) {
        if (jumping == 0)
        {
            global.zspd = jumpKey * -jumpspeed;
            jumping = 1;
        }
    }
}
// Sprinting
if (hspd <> 0 or vspd <> 0) {
    if (dashKey) {
        if (obj_playerStats.stamina >= DASH_COST) 
        {
            // Dash
            audio_sound_pitch(snd_dash,random_range(0.95,1.25));
            audio_play_sound(snd_dash,10,false);
            global.playerState = scr_dash_state;
            alarm[0] = room_speed/4;
            obj_playerStats.stamina -= DASH_COST;
            obj_playerStats.alarm[0] = room_speed/8;
        }
    }
}
if (burntout == 0)
{
    if (obj_playerStats.stamina < DASH_COST) {
    burntout = 1;
    }
}
if (burntout == 1)
{
    spd = spd/1.5;
    magnitude = magnitude/1.5;
}
if (burntout == 1 && pStats.stamina == pStats.maxstamina)
{
    burntout = 0;
}

if (global.speaking == true) {
image_speed = 0;
image_index = 7;
exit;
}

// Attacking
if (attackKey) {
    image_index = 0;
    audio_sound_pitch(snd_attack,random_range(0.95,1.25));
    audio_play_sound(snd_attack,10,false);
    global.playerState = scr_attack_state;
}

// Sneaking
if (sneakKey)
{
    spd = spd/2;
    magnitude = magnitude/2;
    global.isSneaking = 1;
    global.wasSneaking = 1;
    // 0 = not sneaking; 1 = sneaking
} else {global.isSneaking = 0; alarm[1] = 1;}

// Get length (dir does not equal magnitude!)
if (xaxis == 0 and yaxis == 0) {
    len = 0;
} else {
    len = spd*magnitude;
    scr_get_face(dir);
}

// Move the character

    hspd = lengthdir_x(len,dir);
    vspd = lengthdir_y(len,dir);
    phy_position_x += hspd;
    phy_position_y += vspd*-1;
    image_speed = clamp(len,0.4,1);

// Animation Stop
        if (!rightKey and !leftKey and !downKey and !upKey)
        {
            image_speed = 0;
            image_index = 7;
        }
        if (rightKey and leftKey)
        {
            image_speed = 0;
            image_index = 7;
            hspd = hspd*0;
            vspd = vspd*0;
        }
        if (downKey and upKey)
        {
            image_speed = 0;
            image_index = 7;
            hspd = hspd*0;
            vspd = vspd*0;
        }
        if (rightKey and leftKey and downKey and upKey)
        {
            image_speed = 0;
            image_index = 7;
        }
