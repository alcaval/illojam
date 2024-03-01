_jarri_spawned = false
_enemy_defeat = false
_enemy_cooldown_timer = 0

function respawn_jarri() {
	instance_create_layer(obj_jarri_spawn.x,obj_jarri_spawn.y,"jarri_socser", obj_jarri_player)
	_jarri_spawned = true
}

function respawn_jarri_enemy() {
	enemy = instance_create_layer(obj_enemy_spawn.x,obj_enemy_spawn.y,"jarri_socser", obj_enemy_jarri_socser)
	enemy.image_xscale = 0.4
	enemy.image_yscale = 0.4
	_jarri_spawned = true
	enemy._active = true
}

