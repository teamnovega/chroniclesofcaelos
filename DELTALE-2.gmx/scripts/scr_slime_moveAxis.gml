if(global.gP) exit;
if(global.speaking) exit;
var dir = point_direction(0,0,xaxis,yaxis);
var hspd = lengthdir_x(spd,dir);
var vspd = lengthdir_y(spd,dir);
if (hspd != 0) {
    image_xscale = sign(hspd);
}
phy_position_x += hspd;
phy_position_y += vspd;
