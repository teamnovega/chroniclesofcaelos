// Returns True/False Whether A Given SongNumber/LayerNumber 
// combination is valid.

// Right now this function just says whether the indexes fall
// within the dimensions.  It doesn't check to see if the position
// is actually initialized to a value.  I was originally going to
// do it with a -1 initialized value indicating the position had never
// been set, but ran into some problems and took them out, but left
// that in here in case I implement it in a later version.

var local_validSong = argument[0];
var local_validLayer = argument[1];
var local_isValid = false;

// If this falls within the range of the two dimensions of the multidimensional
// array, then check what's there, and if it's not -1, flag it as valid.
if (local_validSong < array_height_2d(song) && local_validSong >= 0) {
    if (local_validLayer < array_length_2d(song,local_validSong) && local_validLayer >= 0) {
        if (song[local_validSong,local_validLayer] != -1) {
            local_isValid = true;      
        }
    }
}

return local_isValid;
