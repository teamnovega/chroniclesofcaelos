// This goes in the Create Event of the obj_music_player object





// Rewrite This Array However You Want
// Just Be Sure That The Next Array (crossfadeByMicros)
// matches the length of the first dimension of this array

// First dimension (height) of the array tells the song number,
// Second dimension (length) of the array tells the layer number.
// Follow common sense rules for these.
// Don't skip layers (like putting in one for positions 0 and 2,
// or 1 and 2.)

song[0,0] = music_chaos0;
song[0,1] = music_chaos1;
song[0,2] = music_chaos2;

song[1,0] = music_factory0;
song[1,1] = music_factory1;
song[1,2] = music_factory2;

song[2,0] = music_puzzlebox0;
song[2,1] = music_puzzlebox1;
song[2,2] = music_puzzlebox2;

song[3,0] = music_puzzlecube0;
song[3,1] = music_puzzlecube1;
song[3,2] = music_puzzlecube2;


/*    UNCOMMENT THESE AS YOU LOAD IN THE VARIOUS EXPANSIONS

song[4,0] = music_hopeless0;
song[4,1] = music_hopeless1;
song[4,2] = music_hopeless2;
song[4,3] = music_hopeless3;

song[5,0] = music_sanguine0;
song[5,1] = music_sanguine1;
song[5,2] = music_sanguine2;
song[5,3] = music_sanguine3;

song[6,0] = music_plankton0;
song[6,1] = music_plankton1;
song[6,2] = music_plankton2;

song[7,0] = music_glieseshort0;
song[7,1] = music_glieseshort1;
song[7,2] = music_glieseshort2;
song[7,3] = music_glieseshort3;

*/


// Crossfade By This Amount Of Microseconds When Looping
// (1,000,000 Microseconds in A Second)
// Array Index Is Song Number

crossfadeByMicros[0] = 60000;    // 60ms  
crossfadeByMicros[1] = 60000;    // 60ms  
crossfadeByMicros[2] = 140000;   // 140ms 
crossfadeByMicros[3] = 60000;    // 60ms



/*  UNCOMMENT THESE AS YOU LOAD IN THE VARIOUS EXPANSIONS

crossfadeByMicros[4] = 7000000;  // 7s    (for music_hopeless)
crossfadeByMicros[5] = 10000000; // 10s   (for music_sanguine)
crossfadeByMicros[6] = 8000000;  // 8s    (for music_plankton)
crossfadeByMicros[7] = 30000;    // 30ms  (for music_glieseshort)
*/




// Measured in Microseconds
// You might want to adjust this depending
// on the platform you're on.
// This is only really a big deal for seamless looping.
expectedLatency = 100000;







// YOU DON'T NEED TO TOUCH THIS STUFF
// And probably shouldn't.


// This contains the ID numbers of the current clips that are playing
// It is filled in as you play things, so it may have null gaps at given
// points in time.
players[0] = 0; 

// In order to facilitate crossfaded looping, there needs to be more
// than one player playing every sound.  In this case, we have 2
// for each sound.
multiplyPlayersBy = 2;

// This says which of the two players playing each sound is the active
// one.  (If you're in the middle of a fade, the one the fade ends on
// is the active one from the moment the fade starts.)
// If the previous variable is 2, this will always be 0 or 1.
activeMultiple = 1;

// This contains the player number (for the previous array) for every given
// song and layer assuming we're on activeMultiple 0.  The player numbers
// for additional multiples follow consecutively.  Simply take the number
// you get from here, and add the multiple number you want access to.
// For Example:   
// audioID = players[playerNumberRecords[currentSongNumber,currentLayerNumber]+activeMultiple];
playerNumberRecords[0,0] = 0;

// This variable stores the current priority that this object is fed through the
// scr_music_play() and scr_music_fadein_play() functions, which are passed through
// to the GameMaker audio system.
musicPriority = 10;

// This is the current song number.  As stated above, if two sounds are transitioning,
// the moment the fade/transition begins, the end result of the fade is the "current"
// song/layer, and the beginning appearance of the fade is the "last" song/layer.
currentSongNumber = 0;

// Current layer number.
currentLayerNumber = 0;

// Last song number.
lastSongNumber = 0;

// Last layer number.
lastLayerNumber = 0;

// The active multiple of the last song/layer.
lastActiveMultiple = 0;

// This gets set to 0 when a new file starts playing
// and is incremented with delta_time on every step
// It does NOT get reset when you switch layers (because
// those files are already playing, and we need currentTimeMicros
// to tell us when to start the looping crossfade.)
// For transition time calculations, use currentSwitchTimeMicros.
currentTimeMicros = 0;

// As mentioned above, this is an accumulated delta_time used for
// transitions between layers of the same song/activeMultiple.
currentSwitchTimeMicros = 0;

// Is the current song supposed to loop?
currentlyLooping = false;

// Is the play button on the tape recorder shoved in?
// Remember, it's still shoved in if pause is engaged.
currentlyPlaying = false;

// The currentTimeMicros to look for when we should start our
// loop crossfade.
loopAtMicros = 0;

// Global volume.  All volumes going to the GameMaker audio system
// get multiplied by this.  Range of 0.0-1.0
currentVolumeScale = 1.0;

// We're actually in the crossfade region of the looping crossfade.
currentlyLoopingCrossfading = false;

// Stores our progress during that looping crossfade.  A linear taper
// between 0.0 and 1.0
currentLoopingCrossfadeProgress = 0.0;

// Stores our volume during the looping crossfade.  A NON-linear taper
// between 0.0 and 1.0 that is the return of a function of the linear
// progress taper.  (created by scr_music_crossfadeTaper)
// I think this sounds better for crossfades than the GameMaker audio
// default taper, but I think the GameMaker audio default taper sounds
// better for fadeins/fadeouts, so for those, the progress is fed directly
// as a volume scalar.
currentPlayerLoopingCrossfadeVolume = 0.0;

// This is used to store the previous looping crossfade volume, so that
// we can clamp to it during certain operations (so that crossfading
// while a fade-in is still in progress doesn't let the first audio
// ever get louder than the maximum level it reached during the fade-in.
lastPlayerLoopingCrossfadeVolume = 1.0;

// We're actually in the crossfade region of the layer crossfade.
currentlyLayerCrossfading = false;

// An amount in microseconds that it takes for the entire duration of
// the layer crossfade.  This isn't a constant or setting.  It gets
// set with each crossfade function.
layerCrossfadeByMicros = 2000000;

// Stores our progress during that layer crossfade.  A linear taper
// between 0.0 and 1.0
currentLayerCrossfadeProgress = 0.0;

// Stores our volume during the layer crossfade.  A NON-linear taper
// between 0.0 and 1.0 that is the return of a function of the linear
// progress taper.  (created by scr_music_crossfadeTaper)
// I think this sounds better for crossfades than the GameMaker audio
// default taper, but I think the GameMaker audio default taper sounds
// better for fadeins/fadeouts, so for those, the progress is fed directly
// as a volume scalar.
currentPlayerLayerCrossfadeVolume = 0.0;

// This is used to store the previous layer crossfade volume, so that
// we can clamp to it during certain operations (so that crossfading
// while a fade-in is still in progress doesn't let the first audio
// ever get louder than the maximum level it reached during the fade-in.
lastPlayerLayerCrossfadeVolume = 1.0;

// This is a linear taper between 0.0 and 1.0 that also serves as the volume
// of the crossfade, which I think sounds better than the custom taper for
// fade-ins and fade-outs.
currentFadeInProgress = 0.0;

// This is a linear taper between 0.0 and 1.0 that also serves as the volume
// of the crossfade, which I think sounds better than the custom taper for
// fade-ins and fade-outs.
currentFadeOutProgress = 0.0;

// The ID given by the GameMaker audio system of the currently playing 
// audio clip, since retrieving it each time is tedious.
currentPlayerID = 0;

// The ID given by the GameMaker audio system of the last played
// audio clip, (either the previous song or the beginning track of a fade.)
lastPlayerID = 0;

// Tells us if we're in a paused state.
paused = false;

// In the nested for loop below, I initialize all the layerVolumes[] values
// to this value.  I think it's better to have everything default at 0.5 so
// you can cut OR boost certain layers.
defaultLayerVolume = 0.5;

// In a fading in state.
fadingIn = false;

// The length we want our fade to be.
fadeInTimeMicros = 0;

// In a fading out state.
fadingOut = false;

// The timestamp we want our fadeout to start
fadeOutTimeMicrosStart = 0;

// The timestamp we want our fadeout to end
// fadeOutTimeMicrosEnd-fadeOutTimeMicrosStart is our fade out length.
fadeOutTimeMicrosEnd = 0;


// Initialize Array Of Player IDs, one for each layer multiplied by the multiplyPlayersBy
var local_playerNumber = 0;
for (songNumber=0; songNumber<array_height_2d(song); songNumber++) {
    for (layerNumber=0; layerNumber<array_length_2d(song,songNumber); layerNumber++) {
        
        // Documents the first multiple player for each track.  Others are after it consecutively.
        // So, you can always reference the first multiple and add the multiple number to get the appropriate playerNumber.
        playerNumberRecords[songNumber,layerNumber] = local_playerNumber;
        
        // Sets layerVolumes to the default layerVolume
        layerVolumes[songNumber,layerNumber] = defaultLayerVolume;
        
        // This just puts our multiples consecutively after each layer.
        for (playerMultiple = 0; playerMultiple<multiplyPlayersBy; playerMultiple++) {
            players[local_playerNumber] = 0;
            local_playerNumber++;
        }
    }
}


/*
If you need to pre-define layer volumes, do it down here as such.
(All volumes should be between 0 and 1.  Default is 0.5)

layerVolumes[0,0] = 0.5;


You can also set via scripting by calling

obj_music_player.scr_music_set_layer_volume[0,0,0.5];

*/
