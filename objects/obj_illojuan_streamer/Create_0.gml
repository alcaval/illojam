/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

game_layer = "si_o_no"
dialogue = [
		"idle$Hola buenas soy el famoso streamer illojuan",
		"thinking$A ver qué hago para probar esto",
		"frustrao$No se me ocurre nah",
		"focused$Voy a buscar en internet",
		"ennove$Ennove la gente tah reventa",
		"happy$Bueno si estoy aqui es porque furula jaja"
		]

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
	else {
		old_sprite = new_sprite
		new_sprite = spr_map[? "focused"]
		//sprite_index = spr_map[? "focused"]
		current_line = ""
		instance_activate_layer(game_layer)
	}
}

illojuan_say_text()



