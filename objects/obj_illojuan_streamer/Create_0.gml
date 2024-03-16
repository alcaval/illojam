/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

game_layer = "si_o_no"
start_dialogue = [
		"idle$Cogen estos dos y me sientan delante de dos botones",
		"thinking$Y me dicen que le de al verde o al rojo dependiendo si las fotos son de mi perra o no",
		"ennove$Y yo les digo que ellos a Lana la habían visto 80 veces",
		"frustrao$Pero nada, que tuve que ponerme a decirles en qué fotos salía Lana...",
		]
end_dialogue = [
		"happy$Me dicen que gracias por colaborar y que puedo continuar. ",
		"thinking$Yo estaba pensando to el rato que estos no habían hecho ni el huevo pero mira,",
		"ennove$ya estaba en un plan que lo que quería era recuperar a lana y ya está",
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
		audio_pause_sound(snd_bg_talking_music);
		instance_activate_layer(game_layer)
	}
	else {
		room_goto_next()
	}
}

function set_end_dialogue() {
	audio_resume_sound(snd_bg_talking_music);
	instance_deactivate_layer(game_layer)
	is_start_dialogue = false
	dialogue = end_dialogue
	illojuan_say_text()
}

audio_resume_sound(snd_bg_talking_music);
illojuan_say_text()



