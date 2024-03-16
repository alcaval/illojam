/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

game_layer = "perro_paseo"
start_dialogue = []
end_dialogue = [
		"happy$Po weno esto fue el sueño", 		
		"happy$menos mal que ya se ha acabao que esto se estaba haciendo mas largo que AVATAR",
		"happy$anda, vamso a darle un rato al Reddit y ya jugamos.",
		]

dialogue=start_dialogue

instance_deactivate_layer(game_layer)

spr_map = ds_map_create()
spr_map[? "idle"] = spr_illojuan_idle;
spr_map[? "thinking"] = spr_illojuan_thinking;
spr_map[? "happy"] = spr_illojuan_happy;
spr_map[? "frustrao"] = spr_illojuan_frustrao;
spr_map[? "focused"] = spr_illojuan_focused;
spr_map[? "ennove"] = spr_illojuan_ennove;

current_line = ""
is_transitioning = false
alpha = 0
old_sprite = spr_map[? "idle"]
new_sprite = spr_map[? "idle"]

is_start_dialogue = true;
		
function illojuan_say_text() {
	if(array_length(dialogue) > 0) {
		text_split = string_split(dialogue[0], "$")
		old_sprite = new_sprite
		new_sprite = spr_map[? text_split[0]]
		is_transitioning = true
		alpha = 0;
		//sprite_index = spr_map[? text_split[0]]
		current_line = text_split[1]
		array_shift(dialogue)
	}
	else if(is_start_dialogue){
		old_sprite = new_sprite
		new_sprite = spr_map[? "focused"]
		//sprite_index = spr_map[? "focused"]
		current_line = ""
		obj_sound_manager.stop_talking_sound();
		audio_play_sound(snd_outro, 10, true);
		audio_sound_gain(snd_outro, 0, 0);
		audio_sound_gain(snd_outro, 1, 500);
		instance_activate_layer(game_layer)
	}
	else {
		room_goto_next()
	}
}

function set_end_dialogue() {
	instance_deactivate_layer(game_layer)
	is_start_dialogue = false
	dialogue = end_dialogue
	illojuan_say_text()
}


illojuan_say_text()



