/// scr_check_lowHealth();
if (global.playerHP <= 3) {
    if (!audio_is_playing(snd_lowHealth)) {
        audio_play_sound(snd_lowHealth,0,true);
    }
}
