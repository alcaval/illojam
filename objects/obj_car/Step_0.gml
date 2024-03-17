//move the player
x += x_spd * move_Spd;
	
//collisions
if place_meeting(x, y , obj_wall)
{
	instance_destroy();
}

if obj_cowboy_controller.play = false {
	instance_destroy();
}
/*
	if(dead) {
	
		destroy_timer -= 1;
	

	if (destroy_timer == 0) {
		instance_destroy();
	}

	if (spinning_speed != 0) {
		var _ran_y = irandom_range(-2,2)
		var _ran_x = irandom_range(-2,2)
		x = x + _ran_x
		y = y + _ran_y
	    image_angle += spinning_speed;
		
	}
}*/