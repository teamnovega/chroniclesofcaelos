// Private Utility Function

// Returns a value between 0-1 of the progress while fading between layers

var local_newCurrentFadeProgress;

// Since currentSwitchTimeMicros gets reset at the beginning of a layer crossfade,
// we can simply divide that by the crossfade time to get the progress.
local_newCurrentFadeProgress = clamp(currentSwitchTimeMicros/layerCrossfadeByMicros,0.0,1.0);
return local_newCurrentFadeProgress;
