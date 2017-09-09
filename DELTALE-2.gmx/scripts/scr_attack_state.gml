///scr_attack_state
if(global.gP) exit;
scr_get_gamepad_input(0);
var spd = 4;
var magnitude = point_distance(0,0,xaxis,yaxis); //Get distance from center
movement = ATTACK;
image_speed = 1;
var hitboxTime = 0;
var dir = point_direction(0,0,xaxis,yaxis); //Get direction

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

// Get length (dir does not equal magnitude!)
if (xaxis == 0 and yaxis == 0) {
    len = 3;
    dir = facing*90;
} else {
    len = (spd+1)*magnitude;
    scr_get_face(dir);
}

hspd = lengthdir_x(len,dir);
vspd = lengthdir_y(len,dir);
phy_position_x += hspd;
phy_position_y += vspd*-1;

switch (sprite_index) {
    case spr_linkWalkR:
        sprite_index = spr_linkAttackR;
        image_index = 0;
        hitboxTime = 5;
        break;
        
    case spr_linkWalkL:
        sprite_index = spr_linkAttackL;
        image_index = 0;
        hitboxTime = 5;
        break;
        
    case spr_linkWalkF:
        sprite_index = spr_linkAttackF;
        image_index = 0;
        hitboxTime = 3;
        break;
        
    case spr_linkWalkB:
        sprite_index = spr_linkAttackB;
        image_index = 0;
        hitboxTime = 5;
        break;
}

if (image_index >= hitboxTime and attacked == false)
{
    var xx = 0;
    var yy = 0;
    switch (facing) {
        case RIGHT:
            xx = x+24;
            yy = y;
            break;
            
        case LEFT:
            xx = x-24;
            yy = y;
            break;
            
        case DOWN:
            xx = x;
            yy = y+16;
            break;
            
        case UP:
            xx = x;
            yy = y-16;
            break;
    }

    var damage = instance_create(xx,yy+global.z,obj_damage);
    damage.creator = id;
    damage.damage = obj_playerStats.attack;
    attacked = true;
}
// alarm[5] = 4;

// linkAttackF = frame 3
// linkAttackB = frame 5
// linkAttackR & L = frame 5
