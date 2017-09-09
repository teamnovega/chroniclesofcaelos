// Private Utility Function
// Custom Tweening Function For Better Fades

var local_currentFadeProgress = argument[0];
var local_recursions = argument[1];

// If the recursions have been reduced to -1, just return
// the current value, ending the recursion.
if (local_recursions < 0) {
    return local_currentFadeProgress;
}

// If the recursions are set to 0 or higher, call this function recursively
// with the taper/tween value we've already created.
else {
    return scr_music_crossfadeTaper (1.0 - power(2.0,-local_currentFadeProgress) * 2.0 + 1.0,local_recursions-1);
}
