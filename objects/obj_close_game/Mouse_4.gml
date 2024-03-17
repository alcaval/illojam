if(audio_is_playing(snd_versos_perversos)) {
	audio_stop_sound(snd_versos_perversos);
}

if(audio_is_playing(snd_si_o_no_bg)) {
	audio_stop_sound(snd_si_o_no_bg);
}

if(audio_is_playing(snd_cowboy_soundtrack)) {
	audio_stop_sound(snd_cowboy_soundtrack);
}

if(audio_is_playing(snd_jarri_potter)) {
	audio_stop_sound(snd_jarri_potter);
}

obj_sound_manager.resume_talking_sound();
room_goto(r_main)