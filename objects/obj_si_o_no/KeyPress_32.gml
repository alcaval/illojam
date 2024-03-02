var is_successful = (current_option == obj_button_yes && character.is_character_true) 
||  (current_option == obj_button_no && !character.is_character_true);
//var is_successful = (current_option == obj_button_yes && array_get_index(true_characters, character) != -1) 
//||  (current_option == obj_button_no && array_get_index(fake_characters, character) != -1);

if(is_successful)
{
	audio_play_sound(snd_correct, 0, false);
}

else
{
	audio_play_sound(snd_versos_perversos, 0, false);
}