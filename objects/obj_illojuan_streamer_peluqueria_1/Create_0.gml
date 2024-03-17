/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

game_layer = "versos"
start_dialogue = [
		"idle$De repente aparezco por la cara en la peluquería con el Marco y me dice: ",
		"thinking$Siéntate y te hago algo que vas hecho una mierda ",
		"frustrao$y yo pensando que tenía que buscar a la perra, pero bueno",
		"ennove$me senté y le dije que me hiciera lo que viese",
		"happy$El tio me dice: te voy a hase el cortesito empresario que te vas a quedar hecho un pincel ",
		"idle$Al rato me dice: Ale, ya le puedes tirar mostro a busca a Lana y le tiré palante más rayao que una zebra",
		"frustrao$porque no me estaba enterando de lo que pasaba pero weno. ",
		"ennove$Luego no vea lo que me encontré...",
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
		room_goto_next()
	}
}
obj_sound_manager.resume_talking_sound();
illojuan_say_text()



