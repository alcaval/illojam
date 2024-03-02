/// @description Initial variable values
// Puede escribir su código en este editor

characters = [obj_fake_bokeron, obj_fake_guillem, obj_true_bokeron, obj_true_guillem]
character = obj_fake_bokeron;

current_option = obj_button_yes;


bip_sounds = [snd_bip_1, snd_bip_2, snd_bip_3]
bip_ascending = true
bip_index = 0

correct_guesses = 0;

randomize();
index_character = irandom(array_length(characters)-1)
character = characters[index_character]

instance_create_layer(x,y, layer, character)
show_debug_message(object_get_name(character))

function reset() {
	if(correct_guesses >= 10) {
	
	}
	else {
		instance_destroy(character)
		array_delete(characters, index_character, 1)
		index_character = irandom(array_length(characters)-1)
		character = characters[index_character]
		instance_create_layer(x,y, layer, character)
		show_debug_message(object_get_name(character))
	}
}