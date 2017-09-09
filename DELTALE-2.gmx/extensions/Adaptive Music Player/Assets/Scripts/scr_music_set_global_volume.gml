// Set The Global Volume (Between 0.0 and 1.0)

var local_newVolume = argument[0];
var local_timeMS = 5;

// If we're doing a fade of any sort, the global volume will be applied during
// that other fade.  This next block is only applicable to update the volume
// once upon receiving the new value.
if (!currentlyLoopingCrossfading && !currentlyLayerCrossfading && !fadingOut && !fadingIn) {
    // Clamp us between 0 and 1
    local_newVolume = clamp(local_newVolume,0.0,1.0);
    // Figure out what player number we're stored in
    var local_thePlayerNumber = scr_music_get_player_number(currentSongNumber,currentLayerNumber,activeMultiple);
    // Get the ID number stored by that player
    var local_thePlayerID = players[local_thePlayerNumber];
    // Set the volume directly here.
    audio_sound_gain(local_thePlayerID,local_newVolume*layerVolumes[currentSongNumber,currentLayerNumber],local_timeMS);
}

// Set our object scoped variable with the new value regardless if this function
// performed the gain change.
currentVolumeScale = local_newVolume;

