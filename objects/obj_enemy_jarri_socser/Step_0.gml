if (_active) {
	if (send_away_timer > 0) {
	    send_away_timer -= 1;
	}
	if (destroy_timer > 0 && dead) {
	    destroy_timer -= 1;
	}
	if (shoot_timer > 0) {
	    shoot_timer -= 1;
	}

	if (!dead) {
		_v_speed = _v_speed + _gravity

		if (place_meeting(x, y + 1, obj_jarri_wall)) {
			_v_speed = irandom_range(-5, -20)
		}
		y = y + _v_speed

		if (shoot_timer == 0) {
		    instance_create_layer(x,y,"jarri_socser", obj_flipendo_enemy)
			var direction_j = point_direction(x, y, obj_jarri_player.x, obj_jarri_player.y);
			with(obj_flipendo_enemy) {
				speed = 10
				direction = direction_j
				image_angle = direction
				stored_direction = direction_j
			}
			shoot_timer = 60
		}
	} else {
		if (send_away_timer == 0 && dead) {
	    var sendAwaySpeedX = lengthdir_x(send_away_speed, send_away_direction);
	    var sendAwaySpeedY = lengthdir_y(send_away_speed, send_away_direction);
        
	    x += sendAwaySpeedX;
	    y += sendAwaySpeedY;

	    spinning_speed = 40;
		destroy_timer = 500
	}

	if (destroy_timer == 0 && dead) {
	    instance_destroy()
	}

	if (spinning_speed != 0) {
		var _ran_y = irandom_range(-2,2)
		var _ran_x = irandom_range(-2,2)
		x = x + _ran_x
		y = y + _ran_y
	    image_angle += spinning_speed;
	}	
	}
}