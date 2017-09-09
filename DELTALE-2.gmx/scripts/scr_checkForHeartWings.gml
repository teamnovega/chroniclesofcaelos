/// scr_checkForHeartWings();
// Check to see if all slots are full.
var full = 0;
for (var i=0; i<array_length_1d(global.heartWing); i++) {
    if (global.heartWing[i] != spr_UI_emptyHW)
    and (global.heartWing[i] != spr_UI_herosEmptyHW) {
        ++full;
    }
}

if (full >= (array_length_1d(global.heartWing)-1)) {
    return true;
} else {
    return false;
}
