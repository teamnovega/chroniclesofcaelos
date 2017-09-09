// This goes in the step event of the obj_music_player object.


// Accumulate Our Delta Time
if (currentlyPlaying && !paused) {
    // Each of these increases each step by the amount of time since
    // the last step (effectively making them a record of the time
    // that has passed since they were last set to zero.
    currentTimeMicros += delta_time;
    currentSwitchTimeMicros += delta_time;
}


// Turn off the currentlyPlaying bool if we're not looping and the song has ended.
if (currentlyPlaying && !paused) {
    if (!currentlyLooping) {
        // If the amount of time the clip has been playing has exceeded the length of
        // the clip, and we aren't looping, indicate that we have stopped.
        if (currentTimeMicros >= audio_sound_length(song[currentSongNumber,currentLayerNumber]) * 1000000) {
            currentlyPlaying = false;
        }
    }
}



// Handle Looping (Actual play execution of new audio)

// Fading out takes priority over looping.  If a song ends while fading out,
// it just ends.
if (currentlyPlaying && !paused && !fadingOut) {
    // If we're supposed to eventually loop
    if (currentlyLooping) {
        // If we've passed the time where we're supposed to start the new audio file
        if (currentTimeMicros >= loopAtMicros) {
            // If a layer crossfade is already happening, just
            // cancel it.
            if (currentlyLayerCrossfading) {
                for (stopThisLayer=0; stopThisLayer<array_length_2d(song,lastSongNumber); stopThisLayer++) {
                    // Get the player number that is storing the ID we want.
                    var local_stopThisPlayerNumber = scr_music_get_player_number(lastSongNumber,stopThisLayer,lastActiveMultiple);
                    // Get the ID we want.
                    var local_stopThisPlayerID = players[local_stopThisPlayerNumber];
                    // Stop that ID.
                    audio_stop_sound(local_stopThisPlayerID);
                }
            }
            
            // Now do the transition from one multiple to another.
            lastActiveMultiple = activeMultiple;
            lastSongNumber = currentSongNumber;
            lastLayerNumber = currentLayerNumber;
            activeMultiple++;
            // Loop the multiple.
            activeMultiple = activeMultiple % multiplyPlayersBy;
            for (layerNumber=0; layerNumber<array_length_2d(song,currentSongNumber); layerNumber++) {
                // Get the player number that will be storing our ID.
                var local_playerNumber = scr_music_get_player_number(currentSongNumber,layerNumber,activeMultiple);
                // Play the sound clip, and put the resultant ID number in the player that will store it.
                players[local_playerNumber] = audio_play_sound(song[currentSongNumber,layerNumber],musicPriority,false);
                // Set the volume to 0  (We'll pull it up to 1 later if we're not performing a looping crossfade,
                // but if we are, we want it at 0 so the looping crossfade block below can pull it up as part of
                // the crossfade.)
                scr_music_set_ID_volume(players[local_playerNumber],0.0,currentSongNumber,layerNumber);
            }
            currentlyPlaying = true;
            // Start our time records here.
            currentTimeMicros = 0;
            currentPlayerID = players[scr_music_get_player_number(currentSongNumber,currentLayerNumber,activeMultiple)];
            lastPlayerID = players[scr_music_get_player_number(lastSongNumber,lastLayerNumber,lastActiveMultiple)];
            // If we're doing a looping crossfade, set our progress to 0 and don't raise our volume up.
            if (crossfadeByMicros[currentSongNumber] > 0) {
                currentlyLoopingCrossfading = true;
                currentLoopingCrossfadeProgress = 0.0;
            }
            // If we're not doing a looping crossfade, just pull our current layer volume up.
            else {
                scr_music_set_ID_volume(currentPlayerID,1.0,currentSongNumber,currentLayerNumber);
            }
            // If we were doing a layer crossfade, we stopped the audio earlier, we just need to set the bool here.
            currentlyLayerCrossfading = false;
        }
    }
}


// The following if-elsif structure says
// To handle the fade-in, unless you need to do
// a looping crossfade, then just loop with the new
// track at the full volume, unless you need to do
// a layer crossfade, then forget the fadein or
// looping crossfade and perform the layer crossfade,
// unless you need to do a fadeout, then forget all of
// those and fade out.

// Handle FadeOuts
if (fadingOut && !paused) {
    // Calculate our fadeout progress (between 0 and 1)
    currentFadeOutProgress = scr_music_calculate_fadeout_progress();
    // Invert the graph of our fadeout progress and assign it as our volume.  (As 0 goes to 1, 1 goes to 0)
    // This also means that we're using the natural GameMaker taper for this fade instead of the custom taper
    // I made for crossfades.  I might make a custom taper for fade ins and fade outs later.
    var local_fadeOutVolume = 1.0-currentFadeOutProgress;
    // Clamp us between 0 and the current volume (adjusted to reverse/account for the modifiers/scalars on the volume assignment) so
    // that a fade out can never raise a volume higher than where it is as a result of a fade-in, layer crossfade, or looping crossfade.
    var local_clampedFadeOutVolume = clamp(local_fadeOutVolume,0.0,audio_sound_get_gain(currentPlayerID)/(currentVolumeScale*layerVolumes[currentSongNumber,currentLayerNumber]));
    // Set the volume
    scr_music_set_ID_volume(currentPlayerID,local_clampedFadeOutVolume,currentSongNumber,currentLayerNumber);
    // End the crossfade if our progress hits 1
    if (currentFadeOutProgress >= 1.0) {
        fadingOut = false;
        // When the crossfade ends, since we're fading out, actually stop the song.
        scr_music_stop();
    }
}

// Apply Layer Crossfade Progress
else if (currentlyLayerCrossfading && !paused) {
    // Calculate our progress.
    currentLayerCrossfadeProgress = scr_music_calculate_layer_crossfade_progress();
    // Convert our progress to a volume level using the custom taper.
    currentPlayerLayerCrossfadeVolume = scr_music_crossfadeTaper(currentLayerCrossfadeProgress,2);
    // Convert our volume level to the inverse for the last player, so it fades out while
    // our current player fades in.
    lastPlayerLayerCrossfadeVolume = 1.0-currentPlayerLayerCrossfadeVolume;
    // Clamp our last player between 0 and the current volume level (adjusted to reverse/account for the modifiers/scalars on the volume assignment) so
    // that fading out the last clip can never raise it to a volume higher than where it is a result of a fade-in, fade-out, layer crossfade, or looping crossfade.
    var local_clampedLastPlayerLayerVolume = clamp(lastPlayerLayerCrossfadeVolume,0.0,audio_sound_get_gain(lastPlayerID)/(currentVolumeScale*layerVolumes[lastSongNumber,lastLayerNumber]));
    // Set our volumes
    scr_music_set_ID_volume(currentPlayerID,currentPlayerLayerCrossfadeVolume,currentSongNumber,currentLayerNumber);
    scr_music_set_ID_volume(lastPlayerID,local_clampedLastPlayerLayerVolume,lastSongNumber,lastLayerNumber);
    // If our progress reaches 1, end the layer crossfade.
    if (currentLayerCrossfadeProgress >= 1.0) {
        currentlyLayerCrossfading = false;
        // If the fade was not a simple layer crossfade, then stop the old song when we get to the end.
        if (lastSongNumber != currentSongNumber) {
            // Go through each layer and stop them all.
            for (stopThisLayer=0; stopThisLayer<array_length_2d(song,lastSongNumber); stopThisLayer++) {
                // Retrieve the player number storing our ID.
                var local_stopThisPlayerNumber = scr_music_get_player_number(lastSongNumber,stopThisLayer,lastActiveMultiple);
                // Retrieve the ID.
                var local_stopThisPlayerID = players[local_stopThisPlayerNumber];
                // Stop the ID
                audio_stop_sound(local_stopThisPlayerID);
            }
        }
    }
}

// Apply Looping Crossfade Progress
else if (currentlyLoopingCrossfading && !paused) {
    // Calculate our progress.
    currentLoopingCrossfadeProgress = scr_music_calculate_looping_crossfade_progress();
    // Convert our progress to a volume level using the custom taper.
    currentPlayerLoopingCrossfadeVolume = scr_music_crossfadeTaper(currentLoopingCrossfadeProgress,2);
    // Convert our volume to the inverse for the last player, so it fades out while
    // our current player fades in.
    lastPlayerLoopingCrossfadeVolume = 1.0-currentPlayerLoopingCrossfadeVolume;
    // Clamp our last player between 0 and the current volume level (adjusted to reverse/account for the modifiers/scalars on the volume assignment) so
    // that fading out the last clip can never raise it to a volume higher than where it is a result of a fade-in, fade-out, layer crossfade, or looping crossfade.
    var local_clampedLastPlayerLoopingVolume = clamp(lastPlayerLoopingCrossfadeVolume,0.0,audio_sound_get_gain(lastPlayerID)/(currentVolumeScale*layerVolumes[lastSongNumber,lastLayerNumber]));
    // Set our volumes
    scr_music_set_ID_volume(currentPlayerID,currentPlayerLoopingCrossfadeVolume,currentSongNumber,currentLayerNumber);
    scr_music_set_ID_volume(lastPlayerID,local_clampedLastPlayerLoopingVolume,lastSongNumber,lastLayerNumber);
    // If our progress reaches 1, end the loopig crossfade
    // Since none of the play commands in this program
    // use the build in looping functionality,
    // we should be able to assume that the clips
    // won't loop and don't need to be manually stopped
    // at this point, unlike the layer crossfade, where
    // they definitely do.
    if (currentLoopingCrossfadeProgress >= 1.0) {
        currentlyLoopingCrossfading = false;
    }
}

// Handle FadeIns
else if (fadingIn && !paused) {
    // Calculate our fade in progress
    currentFadeInProgress = scr_music_calculate_fadein_progress();
    // Assign the progress directly to our volume, following the natural GameMaker taper.
    scr_music_set_ID_volume(currentPlayerID,currentFadeInProgress,currentSongNumber,currentLayerNumber);
    // End our fade in if we hit 1 on the progress.
    if (currentFadeInProgress >= 1.0) {
        fadingIn = false;
    }
}

