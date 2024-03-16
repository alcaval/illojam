/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

game_layer = "jarri_socser"
start_dialogue = [
		"idle$Estaba el marcos montao en el cepillo como si fuera Harry potter ",
		"thinking$y el nota va y me dice que tocaba duelo de magos.",
		"focused$y en nah empieza ahí a tirarme flipendos.",
		]
end_dialogue = [
		"ennove$Menos mal que de esto manejo y le di pal pelo",
		"happy$y ya me dijo que le tirara palante que había atado a la lana a la puerta",
		"happy$y que lo dejara tranquilico unos días.",		
		"ennove$Ha sido largo el sueño pero ya se acaba lo juro.",
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
		instance_activate_layer(game_layer)
		if (obj_jarri_controller._jarri_points == -1) {
			obj_jarri_controller._restart = true
			obj_jarri_controller._enemy_points = 0
			obj_jarri_controller._jarri_points = 0
		}
	}
	else {
		room_goto_next()
	}
}

function set_end_dialogue() {
	obj_sound_manager.resume_talking_sound();
	instance_deactivate_layer(game_layer)
	is_start_dialogue = false
	dialogue = end_dialogue
	illojuan_say_text()
}

obj_sound_manager.resume_talking_sound();
illojuan_say_text()



