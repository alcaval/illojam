instance_destroy();
if(instance_exists(obj_flipendo_enemy)) {
	instance_destroy(obj_flipendo_enemy)
}
other.spinning_speed = 50
other.send_away_timer = 60
other.send_away_direction = obj_jarri_varita.image_angle
other.dead = true
obj_jarri_controller.update_jarri_points()
