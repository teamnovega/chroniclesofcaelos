// Private Utility Function

// Feed This Function The Song Number,
// Layer Number, and Multiple Number,
// and it will return the player number
// that is playing that file.  (NOT PLAYER ID)
// For ID, reference the players array as such:
// playerID = players[scr_music_get_player_number(0,0,0)];

var local_theSongNumber = argument[0];
var local_theLayerNumber = argument[1];
var local_theActiveMultiple = argument[2];
var local_validTrack = false;

if (scr_music_validTrack(local_theSongNumber,local_theLayerNumber)) {
    local_validTrack = true;
}

var newPlayerNumber = 0;
if (local_validTrack) {
    // The playerNumberRecords multidimensional array will spit out a player number
    // that corresponds to an activeMultiple of 0.  The players for the consecutive
    // multiples are numbered consecutively, so you can simply add the desired
    // multiple to the player number.
    newPlayerNumber = playerNumberRecords[local_theSongNumber,local_theLayerNumber] + local_theActiveMultiple;
}

if (newPlayerNumber < 0 || newPlayerNumber >= array_length_1d(players)) {
    local_validTrack = false;
    newPlayerNumber = 0;
}

return newPlayerNumber;
