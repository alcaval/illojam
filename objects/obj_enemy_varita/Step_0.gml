if (instance_exists(obj_enemy_jarri_socser)) {
	x= obj_enemy_jarri_socser.x
	y = obj_enemy_jarri_socser.y
}
if (instance_exists(obj_jarri_player)) {
	var pd = point_direction(x,y,obj_jarri_player.x, obj_jarri_player.y)
	var dd = angle_difference(image_angle, pd)
	image_angle -= min(abs(dd), 10) * sign(dd)
}