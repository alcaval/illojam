/// @description Initial variable values
// Puede escribir su código en este editor

character = obj_fake_bokeron;
current_option = obj_button_yes;
fake_characters = [obj_fake_bokeron, obj_fake_guillem];
true_characters = [obj_true_bokeron, obj_true_guillem];

randomize();
var is_true_character = random(1) < 0.5;

if(is_true_character) {
	character = true_characters[irandom(array_length(true_characters)-1)]
} else {
	character = fake_characters[irandom(array_length(fake_characters)-1)]
}

instance_create_layer(x,y, layer, character)
show_debug_message(object_get_name(character))

