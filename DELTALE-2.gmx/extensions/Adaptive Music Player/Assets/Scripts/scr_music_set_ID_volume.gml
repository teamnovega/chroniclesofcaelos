// Private Utility Function

// Sets the actual gain of a sound.

var local_thePlayerID = argument[0];
var local_newVolume = argument[1];
var local_theSongNumber = argument[2];
var local_theLayerNumber = argument[3];
var local_timeMS = 0;
var local_theLayerVolume = layerVolumes[local_theSongNumber,local_theLayerNumber];
// Sets the gain of the ID provided, and multiplies the requested gain by the global volume and the layer volume.
audio_sound_gain(local_thePlayerID,local_newVolume*currentVolumeScale*local_theLayerVolume,local_timeMS);
