/// getWidthOrHeight(0_or_1);
// 0 = width; 1 = height;
if window_get_fullscreen() {
    width = display_get_width();
    height = display_get_height();
} else {
    width = window_get_width();
    height = window_get_height();
}

if (argument0 = 0) {
    return width;
} else {
    return height;
}
