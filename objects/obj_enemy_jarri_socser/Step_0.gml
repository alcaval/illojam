if (x < 0 || x > room_width || y < 0 || y > room_height) {
	obj_jarri_controller._enemy_spawned = false
	obj_jarri_controller._enemy_cooldown_timer = 5
	instance_destroy()
}

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
			_v_speed = irandom_range(-5, -15)
		}
		y = y + _v_speed

		if (shoot_timer == 0) {
			show_debug_message(obj_enemy_varita.image_angle)
		    var _bullet = instance_create_layer(x,y,"jarri_socser", obj_flipendo_enemy)
			with(_bullet) {
				speed = 10;
				direction = obj_enemy_varita.image_angle;
				image_angle = direction;
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