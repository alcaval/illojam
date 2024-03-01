if (keyboard_check_pressed(vk_enter)) {
	show_debug_message("a")
	instance_create_layer(obj_jarri_spawn.x,obj_jarri_spawn.y,"jarri_socser", obj_jarri_player)
	obj_jarri_player.image_xscale = 0.5
	obj_jarri_player.image_yscale = 0.5
	_jarri_spawned = true
}

if (_enemy_defeat == true) {

}