// Private Utility Function

// Returns a value between 0-1 of the progress while fading between duplicate instances
// of the same layer when looping.

var local_newCurrentFadeProgress;

// Since currentTimeMicros gets reset at the beginning of a looping crossfade, we can
// get our progress value simply by dividing that by the length of the crossfade.
local_newCurrentFadeProgress = clamp(currentTimeMicros / crossfadeByMicros[currentSongNumber],0.0,1.0);
return local_newCurrentFadeProgress;
