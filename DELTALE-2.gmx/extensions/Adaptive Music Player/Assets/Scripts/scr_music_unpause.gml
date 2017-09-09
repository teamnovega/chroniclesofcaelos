// Unpause The Music

if (currentlyPlaying && paused) {
    paused = false;
    
    // Go through all of the players and unpause all of them.
    for (thePlayerNumber=0; thePlayerNumber<array_length_1d(players); thePlayerNumber++) {
        if (audio_is_paused(players[thePlayerNumber])) {
            audio_resume_sound(players[thePlayerNumber]);
        }
    }
}

