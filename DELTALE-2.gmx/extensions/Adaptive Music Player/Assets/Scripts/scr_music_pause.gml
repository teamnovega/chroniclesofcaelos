// Pause the Music

if (currentlyPlaying) {
    paused = true;
    
    // Go through all of the players and pause them all.
    for (thePlayerNumber=0; thePlayerNumber<array_length_1d(players); thePlayerNumber++) {
        if (audio_is_playing(players[thePlayerNumber])) {
            audio_pause_sound(players[thePlayerNumber]);
        }
    }
}

