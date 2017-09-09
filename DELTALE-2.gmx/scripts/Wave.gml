///Wave(from, to, duration, offset);

// Returns a value that will wave back and forth between argument0 and argument1 over
// [duration] seconds.
// Examples:
//      image_angle = scr_wave(-45,45,1,0) -> will make the image rock back and forth 90 degrees in a second.

var second = argument2*room_speed;
var a4 = (argument1 - argument0) * 0.5;
return argument0 + a4 + sin((((current_time * 0.1) + second * argument3) / second) * (pi*2)) * a4;
