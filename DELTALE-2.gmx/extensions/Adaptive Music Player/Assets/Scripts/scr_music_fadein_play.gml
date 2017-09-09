// Use this function to start a new song playing
// but have it fade in instead of start immediately.

// If another song is already playing, it will stop
// immediately and the fade will start.

// local_theFadeInTime is in seconds

var local_songToPlay = argument[0];
var local_layerToPlay = argument[1];
var local_musicPriority = argument[2];
var local_loopingPreference = argument[3];
var local_theFadeInTime = argument[4];

scr_music_stop();
currentlyPlaying = false;
currentlyLayerCrossfading = false;
currentlyLoopingCrossfading = false;
fadingOut = false;
fadingIn = true;
// Convert time in seconds to time in microseconds.
fadeInTimeMicros = local_theFadeInTime * 1000000;
scr_music_play(local_songToPlay,local_layerToPlay,local_musicPriority,local_loopingPreference,0);


