/// setGUIResolution();
if !window_get_fullscreen() {
    width = window_get_width();
    height = window_get_height();
} else {
    width = display_get_width();
    height = display_get_height();
}

if (height >= 1440) {
    display_set_gui_size(width/2,height/2);
} else {
    display_set_gui_size(width,height);
}
