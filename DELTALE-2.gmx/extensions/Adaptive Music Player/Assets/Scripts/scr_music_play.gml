// Use this as a function to start playing a 
// song or to crossfade to a new song or layer.
// Example Usage:   obj_music_player.scr_music_play(songNumber,layerNumber,musicPriority,loop,crossfadeBySeconds);

var local_songToPlay = argument[0];
var local_layerToPlay = argument[1];
musicPriority = argument[2];
var local_loopingPreference = argument[3];
// Convert input of seconds to microseconds
layerCrossfadeByMicros = argument[4] * 1000000;
var local_validTrack = false;
var local_syncSwitch = false;

// Check if the arguments specify a valid track
// This doesn't protect against null or uninitialized
// entries though. 
if (scr_music_validTrack(local_songToPlay,local_layerToPlay)) {
    local_validTrack = true;
    paused = false;
}

// Instead of starting all the layers of the requested song,
// we are simply going to crossfade to a new layer that's
// already playing.
// If you wish for the layer to start over instead of crossfade,
// simply call stop right before calling the new play.
if ((local_songToPlay == currentSongNumber) && currentlyPlaying) {
    local_syncSwitch = true;
}

// Set looping variables if we want looping.
if (local_validTrack) {
    currentlyLooping = local_loopingPreference;
    // Set a local variable tentatively to say we're looping at the end of the song.
    var local_loopAtTime = audio_sound_length(song[local_songToPlay,local_layerToPlay]);
    // Convert the length in seconds of the temporary variable to length in microseconds on the object variable.
    loopAtMicros = local_loopAtTime * 1000000;
    // Decrement the loop time by the length of the desired crossfade.
    loopAtMicros -= crossfadeByMicros[local_songToPlay];
    // Negative loop times aren't allowed.
    if (loopAtMicros < 0) {
        loopAtMicros = 0;
    }
}

// If any crossfade is going on, set the volume of the oldest audio clip to zero
// so that we can just handle the levels of two files instead of three.
if (currentlyLoopingCrossfading || currentlyLayerCrossfading) {
    // Get the GameMaker ID of a sound
    var local_turnThisOff = players[scr_music_get_player_number(lastSongNumber,lastLayerNumber,lastActiveMultiple)];
    // Change the volume of that sound.
    scr_music_set_ID_volume(local_turnThisOff,0.0,lastSongNumber,lastLayerNumber);
}

if (local_validTrack) {
    lastSongNumber = currentSongNumber;
    lastLayerNumber = currentLayerNumber;
    lastActiveMultiple = activeMultiple;
    currentSongNumber = local_songToPlay;
    currentLayerNumber = local_layerToPlay;
    
    // If we ARE doing a crossfade without
    // stopping the current song, don't increment
    // the activeMultiple.  And if we are, then
    // do increment it in this block.
    if (!local_syncSwitch) {
        activeMultiple++;
        // This loops the activeMultiple.  Look up "modulus" if you don't know how this works.
        activeMultiple = activeMultiple % multiplyPlayersBy;
    }
    
    // If we're starting a set of layers at the beginning
    // (switching songs), then record all the IDs of the sounds
    // when we start the audio tracks.
    if (!local_syncSwitch) {
        // Go through all the layers of the current song and start all the layers
        for (layerNumber=0; layerNumber<array_length_2d(song,currentSongNumber); layerNumber++) {
            // Find what player number this file should be indexed at, and store it as a local variable.
            var local_playerNumber = scr_music_get_player_number(currentSongNumber,layerNumber,activeMultiple);
            // Use that player number to index the GameMaker ID number of the sound so we can modify it later.
            players[local_playerNumber] = audio_play_sound(song[currentSongNumber,layerNumber],musicPriority,false);
            
            // When starting a new layer, set all but the current layer to 0 volume.
            if (layerNumber != currentLayerNumber) {
                scr_music_set_ID_volume(players[local_playerNumber],0.0,currentSongNumber,layerNumber);
            }
        }
    }
    
    // Assign the IDs of the current and last sounds.
    currentPlayerID = players[scr_music_get_player_number(currentSongNumber,currentLayerNumber,activeMultiple)];
    lastPlayerID = players[scr_music_get_player_number(lastSongNumber,lastLayerNumber,lastActiveMultiple)];

    // Get ready for a crossfade by setting the current track to 0 and let
    // the step event pull it up.
    if (currentlyPlaying && layerCrossfadeByMicros > 0) {
        currentlyLayerCrossfading = true;
        scr_music_set_ID_volume(currentPlayerID,0.0,currentSongNumber,currentLayerNumber);
    }
    
    // If we're not doing a crossfade, set current to 1 and last to 0
    // This may be redundant in some cases.
    else if (currentlyPlaying){
        scr_music_set_ID_volume(currentPlayerID,1.0,currentSongNumber,currentLayerNumber);
        scr_music_set_ID_volume(lastPlayerID,0.0,lastSongNumber,lastLayerNumber);
    }
    
    // If we're starting from a stopped state, just start it at full volume
    else if (!fadingIn) {
        scr_music_set_ID_volume(currentPlayerID,1.0,currentSongNumber,currentLayerNumber);
    }
    
    else {
        scr_music_set_ID_volume(currentPlayerID,0.0,currentSongNumber,currentLayerNumber);
    }
    
    // Set our state.
    currentlyPlaying = true;
    
    // If we started players over, reset our accumulated delta time.
    if (!local_syncSwitch) {
        currentTimeMicros = 0;
    }
    
    // Regardless if we started players over, reset our fading accumulated delta time.
    currentSwitchTimeMicros = 0;
    
    // Cancel any currently engaged looping crossfade.
    currentlyLoopingCrossfading = false;  
}
