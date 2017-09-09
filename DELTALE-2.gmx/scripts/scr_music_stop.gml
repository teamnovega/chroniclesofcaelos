// Stops and Unpauses All Tracks


if (currentlyPlaying) {
    // Go through every player and stop anything that is playing.
    for (thePlayerNumber=0; thePlayerNumber<array_length_1d(players); thePlayerNumber++) {
        if (audio_is_playing(players[thePlayerNumber]) ||
            audio_is_paused(players[thePlayerNumber])) {
            
            audio_stop_sound(players[thePlayerNumber]);  
        }
    }
    if (paused) {
        paused = false;
    }
    currentlyPlaying = false;
    currentlyLooping = false;
    currentlyLoopingCrossfading = false;
    currentlyLayerCrossfading = false;
}
