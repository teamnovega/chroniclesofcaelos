// Private Utility Function

// Returns a value between 0-1 of the progress while fading in

var local_newCurrentFadeProgress;
// Since currentTimeMicros gets reset at the beginning of a fade-in,
// we can simply divide that by the fade-in time to get the progress.
local_newCurrentFadeProgress = clamp(currentTimeMicros/fadeInTimeMicros,0.0,1.0);
return local_newCurrentFadeProgress;
