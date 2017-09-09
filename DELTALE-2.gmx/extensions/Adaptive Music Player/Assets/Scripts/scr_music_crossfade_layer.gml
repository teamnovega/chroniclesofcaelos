// Crossfade to a new layer.
// This function lets you specify just
// a layer number and a time for the crossfade

var local_newLayer = argument[0];
var local_switchTime = argument[1];
var local_validTrack = false;

if (scr_music_validTrack(currentSongNumber,local_newLayer)) {
    local_validTrack = true;
}

if (local_validTrack && currentLayerNumber == local_newLayer) {
    local_validTrack = false;
}

if (local_validTrack) {
    scr_music_play(currentSongNumber,local_newLayer,musicPriority,currentlyLooping,local_switchTime);
}
