var is_successful = (current_option == obj_button_yes && character.is_character_true) 
||  (current_option == obj_button_no && !character.is_character_true);

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