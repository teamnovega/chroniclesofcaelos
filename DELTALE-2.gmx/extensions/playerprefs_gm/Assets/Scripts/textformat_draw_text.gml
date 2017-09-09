/// textformat_draw_text( string , color);

var str = argument0;
draw_set_colour(argument1);
draw_text(_code_x, _code_y, str);
_code_x += string_width(str);
