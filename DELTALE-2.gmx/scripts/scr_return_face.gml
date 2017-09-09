///scr_return_face();
var dir = point_direction(0,0,xaxis,yaxis); //Get direction
facing = round(dir/90);
if (facing == 4) {facing = RIGHT};
return dir;
