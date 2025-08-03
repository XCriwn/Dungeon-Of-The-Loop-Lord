if(keyboard_check(vk_escape)) game_end()

if(global.floor_level == 0) {if(!audio_is_playing(sndMenu)) audio_play_sound(sndMenu, 1, false);}
else audio_stop_sound(sndMenu)

if(global.floor_level == 1) {if(!audio_is_playing(sndLvl1Music)) audio_play_sound(sndLvl1Music, 1, false);}
else audio_stop_sound(sndLvl1Music)

if(global.floor_level == 2) {if(!audio_is_playing(sndLvl2Music)) audio_play_sound(sndLvl2Music, 1, false);}
else audio_stop_sound(sndLvl2Music)

if(global.floor_level == 3 or global.floor_level == 4) {if(!audio_is_playing(sndLvl3Music)) audio_play_sound(sndLvl3Music, 1, false);}
else audio_stop_sound(sndLvl3Music)