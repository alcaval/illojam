_jarri_spawned = false
_enemy_spawned = false
_enemy_cooldown_timer = 0

_jarri_points = -1
_enemy_points = 0

_won = false
_restart = false

_restart_timer = 0

obj_cagaste.visible = false

function update_jarri_points() {
	_jarri_points++
	show_debug_message(_jarri_points)
}

function update_enemy_points() {
	_enemy_points++
	show_debug_message(_enemy_points)
}

function respawn_jarri() {
	instance_create_layer(obj_jarri_spawn.x,obj_jarri_spawn.y,"jarri_socser", obj_jarri_player)
	obj_jarri_player.image_xscale = 0.5
	obj_jarri_player.image_yscale = 0.5
	_jarri_spawned = true
	
}