/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

game_layer = "cowboy_bebop"
start_dialogue = [
		"ennove$Le pisé al caballo a tope pero no veas la de baches que había en la carretera,",
		"happy$aquí no había llegado todavía Alexelcapo a asfaltarlas.",
		]
end_dialogue = [
		"ennove$Y me planté en el Pétalos ahí que ya ni me acordaba de lo que estaba haciendo casi,",
		"idle$menos mal que vi en el balcón a Lana y ya le tiré palante y entré.",
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



