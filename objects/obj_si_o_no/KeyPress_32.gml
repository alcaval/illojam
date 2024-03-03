var isLana = string_pos("lana", sprite_get_name(character.sprite_index))
var is_successful = (current_option == obj_button_yes && isLana) 
||  (current_option == obj_button_no && !isLana);

if(is_successful)
{
	audio_play_sound(snd_correct, 0, false);
	correct_guesses++;
}

else
{
	audio_play_sound(snd_versos_perversos, 0, false);
}

reset();