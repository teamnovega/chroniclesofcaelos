///scr_ratioReturn(width_height_or_aspectratio);
//Setting the Aspect Ratio!
width = 0;
height = 360;

aspect_ratio=display_get_width()/display_get_height();

width=round(height*aspect_ratio);
height = height*aspect_ratio;

return argument0;
