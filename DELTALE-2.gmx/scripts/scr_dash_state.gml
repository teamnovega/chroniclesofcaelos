if(global.gP) exit;
scr_get_gamepad_input(0);
var threshold = argument0; //Deadzone
var device = argument2; //Get device - default is 0
var spd = argument1;
var magnitude = point_distance(0,0,gamepad_axis_value(device, gp_axislh),gamepad_axis_value(device, gp_axislv)); //Get distance from center
// Sprintmeter
global.sprintMeter = 100;
dir = point_direction(0,0,xaxis,yaxis); //Get direction
if (dir = 0) {dir = facing*90;}
len = spd*3;

// Jumping 
global.zspd += zgrav;
global.z += global.zspd;
if (global.z>0) //to be replaced with ground height value later
{
    global.z = 0;
    global.zspd = 0;
    jumping = 0;
}
if (global.z>zground) and (jumping == 1) {
    gamepad_set_vibration(0,0.25,0.25);
    alarm[3] = room_speed/8;
}
if (jumping == 0)
{
    global.zspd = jumpKey * -jumpspeed;
    jumping = 1;
}

// Sneaking
if (sneakKey)
{
    spd = spd/2;
    magnitude = magnitude/2;
    global.isSneaking = 1;
    // 0 = not sneaking; 1 = sneaking
}

// Move the character

    hspd = lengthdir_x(len,dir);
    vspd = lengthdir_y(len,dir);
    phy_position_x += hspd;
    phy_position_y += vspd*-1;
    
        
//Dash Effect
var dash = instance_create(x,y+global.z,obj_mb);
dash.sprite_index = obj_player.sprite_index;
dash.image_index = obj_player.image_index;
