// Private Utility Function

// Returns a value between 0-1 of the progress while fading out

var local_newCurrentFadeProgress;
// Since currentTimeMicros does NOT get reset at the beginning of a fade out,
// we need to get a numerator value that is the time we have been in the fade-out
// so far (currentTimeMicros-fadeOutTimeMicrosStart) and divide it by
// the fade-out time, which in this case I have calculated by taking the difference
// between the end of the fade out and the beginning of the fade out, because of
// something I may want to implement in a later version.
local_newCurrentFadeProgress = clamp((currentTimeMicros-fadeOutTimeMicrosStart)/(fadeOutTimeMicrosEnd-fadeOutTimeMicrosStart),0.0,1.0);
return local_newCurrentFadeProgress;
