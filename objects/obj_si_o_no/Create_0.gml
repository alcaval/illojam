/// @description Initial variable values
// Puede escribir su código en este editor

character_sprites = [spr_lana_1, spr_lana_2, spr_lana_3, spr_lana_4, spr_lana_5, 
					spr_barabas, spr_barbie, spr_herdier, spr_mierdon, spr_ruleofrose, spr_yano]
character = obj_character;
current_index = 0

current_option = obj_button_yes;


bip_sounds = [snd_bip_1, snd_bip_2, snd_bip_3]
bip_ascending = true
bip_index = 0

correct_guesses = 0;

randomize();
character_sprites = array_shuffle(character_sprites)
instance_create_layer(x,y, layer, character)
character.sprite_index = character_sprites[current_index]

function reset() {
	if(correct_guesses >= 10) {
		show_debug_message("GANASTE - PASA A OTRA COSA")
	}
	else {
		current_index = (current_index+1) % array_length(character_sprites)
		if(current_index == 0) {
			character_sprites = array_shuffle(character_sprites)
		}
		character.sprite_index = character_sprites[current_index]
	}
}