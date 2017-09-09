///scr_ideal_wh(width_or_height)
var wh = argument0;
width = 0;
height = 360;
aspect_ratio = window_get_width()/window_get_height();
width = round(height*aspect_ratio);
height = 360*aspect_ratio;
return wh;
