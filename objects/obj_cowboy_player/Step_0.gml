//get inputs
var _rightkey = keyboard_check(vk_right);
var _leftkey = keyboard_check(vk_left);
var _upkey = keyboard_check(vk_up);
var _downkey = keyboard_check(vk_down);

if(obj_cowboy_controller.play && !dead)
{
	//player movement
	var _horizkey = _rightkey - _leftkey;
	var _verkey = _downkey - _upkey;
	cowboy_move_Dir = point_direction(0, 0, _horizkey, _verkey);

	//get speed
	var _spd = 0;
	var _input_level = point_distance(0,0,_horizkey,_verkey);
	_input_level = clamp(_input_level, 0, 1);
	_spd = cowboy_move_Spd * _input_level;
	
	cowboy_x_spd = lengthdir_x(_spd, cowboy_move_Dir);
	cowboy_y_spd = lengthdir_y(_spd, cowboy_move_Dir);
	
	//collisions
	if place_meeting(x + cowboy_x_spd, y , obj_wall)
	{
		cowboy_x_spd = 0;
	}
	
	if place_meeting(x , y + cowboy_y_spd , obj_wall)
	{
		cowboy_y_spd = 0;
	}
	
	//move the player
	x += cowboy_x_spd;
	y += cowboy_y_spd;
}

	if(dead) {
	
		destroy_timer -= 1;
	

	if (destroy_timer == 0) {
		obj_cowboy_controller.cowboy_restart = true;
	}

	if (spinning_speed != 0) {
		var _ran_y = irandom_range(-2,2)
		var _ran_x = irandom_range(-2,2)
		x = x + _ran_x
		y = y + _ran_y
	    image_angle += spinning_speed;
		
	}
}