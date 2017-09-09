///contrast_rgb(r,g,b)

var r = argument0;
var g = argument1;
var b = argument2;
var rgb = make_colour_rgb(r,g,b);
var half = rgb / 2;
show_debug_message(rgb)
if (rgb > half) {
    return c_black;
    show_debug_message(c_black);
} else {
    return c_white;
    show_debug_message(c_white);
}
