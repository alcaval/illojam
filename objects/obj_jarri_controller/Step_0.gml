if (keyboard_check_pressed(vk_enter)) {
	show_debug_message("chcho")
	_restart = true
	_enemy_points = 0
	_jarri_points = 0
}

if (_restart) {
	show_debug_message("empiesa")
	obj_cagaste.visible = false
	_restart = false
	instance_create_layer(obj_jarri_spawn.x,obj_jarri_spawn.y,"jarri_socser", obj_jarri_player)
	obj_jarri_player.image_xscale = 0.5
	obj_jarri_player.image_yscale = 0.5
	_jarri_spawned = true
}

if (_enemy_cooldown_timer > 0 and !_won) {
	_enemy_cooldown_timer--;
	if (_enemy_cooldown_timer = 0) {
		var _enemy = instance_create_layer(obj_enemy_spawn.x,obj_enemy_spawn.y,"jarri_socser", obj_enemy_jarri_socser)
		_enemy.image_xscale = 0.4
		_enemy.image_yscale = 0.4
		_enemy._active = true
		_enemy_spawned = true
	}
}

var _sprite_index_jarri_points = asset_get_index("spr_" + string(_jarri_points))
obj_jarri_points.sprite_index = _sprite_index_jarri_points;
var _sprite_index_enemy_points = asset_get_index("spr_" + string(_enemy_points))
obj_enemy_points.sprite_index = _sprite_index_enemy_points;

if (_jarri_points == 5) {
	_won = true
	obj_jarri_varita.visible = false
}
if (_enemy_points == 5) {
	instance_destroy(obj_jarri_player)
	obj_jarri_varita.visible = false
	obj_cagaste.visible = true
}
