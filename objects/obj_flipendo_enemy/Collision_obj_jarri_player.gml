instance_destroy();
audio_play_sound(snd_grito, 1000, false)
if(instance_exists(obj_flipendo_enemy)) {
	instance_destroy(obj_flipendo_enemy)
}
other.spinning_speed = 50
other.send_away_timer = 60
other.send_away_direction = -obj_enemy_spawn.image_angle
other.dead = true
obj_jarri_controller._jarri_spawned = false
if(instance_exists(obj_enemy_jarri_socser)) {
	obj_enemy_jarri_socser._active = false
	instance_destroy(obj_enemy_jarri_socser)
	obj_jarri_controller.update_enemy_points()
}