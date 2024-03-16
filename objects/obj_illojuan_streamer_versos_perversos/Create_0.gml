/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

game_layer = "versos"
start_dialogue = [
		"idle$Al final el tío me dice: Échame una mano a ver si me acuerdo",
		"thinking$y ya pasas si la Lana mu lejo no habrá ido no?",
		"frustrao$y yo ya to cabreao le tuve que echar una mano",
		"ennove$a ver si el niño se acordaba de la cancioncita.",
		]
end_dialogue = [
		"frustrao$Después de echarle una mano el tío me deja pasá",
		"idle$y me dice: Anda y buscas a la perra a ver si tienes suerte,",
		"ennove$y yo pensando: el nota ya se podría haber quitao pero weno.",
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

obj_sound_manager.stop_talking_sound();
illojuan_say_text()



