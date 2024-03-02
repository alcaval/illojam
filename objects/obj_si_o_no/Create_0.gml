/// @description Initial variable values
// Puede escribir su código en este editor

character = obj_fake_bokeron;
current_option = obj_button_yes;

bip_sounds = [snd_bip_1, snd_bip_2, snd_bip_3]
bip_ascending = true
bip_index = 0
characters = [obj_fake_bokeron, obj_fake_guillem, obj_true_bokeron, obj_true_guillem]

randomize();
character = characters[irandom(array_length(characters)-1)]

instance_create_layer(x,y, layer, character)
show_debug_message(object_get_name(character))