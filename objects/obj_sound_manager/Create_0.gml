/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

persistent = true;
audio_play_sound(snd_bg_talking_music, 10, true);

function resume_talking_sound() {
	if(audio_sound_get_gain(snd_bg_talking_music) <= 0) {
		audio_sound_gain(snd_bg_talking_music, 0.2, 250);
	}
}

function stop_talking_sound() {
	audio_sound_gain(snd_bg_talking_music, 0, 250);
}










