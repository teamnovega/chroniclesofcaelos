// Fade out the current music in a specified number of seconds.

var local_fadeOutIn = argument[0];
// Convert time in seconds to time in microseconds.
fadeOutInMicros = local_fadeOutIn * 1000000;

// Start the fade out at the time we're at right now.
fadeOutTimeMicrosStart = currentTimeMicros;
// End the fade out at the time we're at right now plus the fade out time.
fadeOutTimeMicrosEnd = fadeOutTimeMicrosStart + fadeOutInMicros;
fadingIn = false;
currentlyLayerCrossfading = false;
currentlyLoopingCrossfading = false;
fadingOut = true;
