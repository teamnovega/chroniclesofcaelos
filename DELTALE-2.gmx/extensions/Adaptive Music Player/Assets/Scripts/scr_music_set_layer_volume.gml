// Sets a specific layer volume
// Between 0.0 and 1.0
// At the time of making this, the
// default value for a layer is 0.5

var local_theSongNumber = argument[0];
var local_theLayerNumber = argument[1];
var local_newVolume = argument[2];
var local_timeMS = 5;

// Clamp our new volume between 0 and 1
local_newVolume = clamp(local_newVolume,0.0,1.0);
// Set the volume
layerVolumes[local_theSongNumber,local_theLayerNumber] = local_newVolume;

// If we're not doing a fade and the thing we changed the volume of is
// currently the active layer playing, change it right now so it
// reacts immediately.
if (currentlyPlaying && !currentlyLoopingCrossfading && !currentlyLayerCrossfading && !fadingIn && !fadingOut &&
    currentSongNumber == local_theSongNumber && currentLayerNumber == local_theLayerNumber) {
    // Get the player number that is storing our ID
    var thePlayerNumber = scr_music_get_player_number(currentSongNumber,currentLayerNumber,activeMultiple);
    // Get our ID from that player number
    var thePlayerID = players[thePlayerNumber];
    // Set the gain.
    audio_sound_gain(thePlayerID,local_newVolume*currentVolumeScale,local_timeMS);
}

