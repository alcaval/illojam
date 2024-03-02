if (instance_exists(obj_jarri_player)) {
	var _target_x = obj_jarri_player.x;
	var _target_y = obj_jarri_player.y;

	var _min_angle = -90;
	var _max_angle = 90;

	// Increment rotation angle based on direction
	current_angle += rotation_speed * rotation_direction
	image_angle = current_angle

	// Check if rotation angle reaches limits
	if (current_angle >= _max_angle || current_angle <= _min_angle) {
	    // Invert rotation direction
	    rotation_direction *= -1;
	}

	// Set the distance and direction you want the moving object to keep from the other object
	var _distance_from_target = 50; // Adjust this value as needed
	var _direction_to_target = point_direction(x, y, _target_x, _target_y);

	// Calculate the new position based on the other object's position
	var _new_x = _target_x + lengthdir_x(_distance_from_target, obj_jarri_player.image_xscale);
	var _new_y = _target_y + lengthdir_y(_distance_from_target, obj_jarri_player.image_yscale);

	// Set the moving object's position to the new calculated position
	x = obj_jarri_player.x;
	y = obj_jarri_player.y;
} else {
	visible = false
}