if(current_option == obj_button_yes)
{
	with(obj_hand) {
	x = obj_button_no.x;
	y = y;
	}

	current_option = obj_button_no;
}
else
{
	with(obj_hand) {
	x = obj_button_yes.x;
	y = y;
	}

	current_option = obj_button_yes;
}

audio_play_sound(bip_sounds[bip_index], 10, false);
if(bip_ascending) {
	bip_index = bip_index + 1
	bip_ascending = bip_index != (array_length(bip_sounds)-1)
}
else {
	bip_index = bip_index - 1
	bip_ascending = bip_index == 0
}
