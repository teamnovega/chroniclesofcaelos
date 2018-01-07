/// dialogGet(character,type,line/emote);

// EX: dialogGet(0,22,0) = Gale's Neutral Emote
//     dialogGet(1,00,1) = Mika's First Line

// 0 = Gale, 1 = Mika, 2 = Asher, 3 = Kamryn
// 00 = Dialog, 11 = Character Name, 22 = Emote, 33 = Voice

//////////////// INSERT LINES HERE //////////////
/// NOTE: The first dialog will ALWAYS start with a 1, instead of a 0!!

    /* MURAL CUTSCENE: Introduction to Caelos
            
    */
    
    // Scene 1 - Gale && Mika
        
        // GALE: Hi!
        dialog[0, 1] = "Hi!";
        emote[0, 1] = spr_glc_StayBack;
        voice[0, 1] = snd_dialog;
    
        // MIKA: uh..Hi?
        dialog[1, 1] = "uh..Hi?";
        emote[1, 1] = spr_bGc_example;
        voice[1, 1] = snd_dialog;
    
//////////////// END LINES //////////////////////



// IGNORE THE REST, BELOW IS ALL CODE! DO NOT EDIT UNLESS YOU KNOW WHAT YOU'RE DOING



////////////////////////// CALCULATE / RETURN SCRIPT

var ch, t, l, c;
ch = argument0; // Character
t = argument1; // Type of Dialogue Part
// If it's a Character Name, then a line is not needed.
if (t != 11) {
    l = argument2;
}

//////////

// Return Dialog
if (t == 00) {
    return dialog[ch, l];
} else
// Return Character Name
if (t == 11) {
    getCharacter(ch);
} else
// Return Emote
if (t == 22) {
    return emote[ch, l];
} else
// Return Voice
if (t == 33) {
    return voice[ch, l];
}
