if (send_away_timer > 0) {
    send_away_timer -= 1;
}

if (x < 0 || x > room_width || y < 0 || y > room_height) {
	obj_jarri_varita.visible = false
	obj_jarri_controller._jarri_spawned = false
	obj_jarri_controller.respawn_jarri()
	instance_destroy()
}

if (sprite_index == spr_jarri_player_draw) {
    if (image_index >= image_number - 1) {
        sprite_index = spr_jarri_player;
        image_index = 0;
		_available = true
		obj_jarri_varita.visible = true
		obj_jarri_controller._enemy_cooldown_timer = 5
    }	
}

if (_available) {
var _key_left = keyboard_check(vk_left);
var _key_right = keyboard_check(vk_right);
var _key_jump = keyboard_check_pressed(vk_up);
var _key_shoot = keyboard_check_pressed(vk_space);

if(_key_shoot && !audio_is_playing(snd_jarri_potter_flipendo)) {
	audio_play_sound(snd_jarri_potter_flipendo, 1000, false)
	instance_create_layer(x,y,"jarri_socser", obj_flipendo)
	with(obj_flipendo) {
		speed = 15
		direction = obj_jarri_varita.image_angle
		image_angle = direction
	}
}

if (keyboard_check_pressed(vk_left)){
	show_debug_message(image_xscale)
	image_xscale = image_xscale * -1
} else if (keyboard_check_pressed(vk_right)) {
	show_debug_message(image_xscale)
	image_xscale = abs(image_xscale)
}

var _move = _key_right - _key_left;
_h_speed = _move * _walk_speed
_v_speed = _v_speed + _gravity

//JUMP
if (place_meeting(x, y + 1, obj_jarri_wall) && (_key_jump)) {
	_v_speed = -12
	_jump_time = 1;
}

//COLISION HORIZONTAL
if (place_meeting(x + _h_speed, y, obj_jarri_wall)) {
	while (!place_meeting(x + sign(_h_speed), y, obj_jarri_wall)) {
		x = x + sign(_h_speed)
	}
	_h_speed = 0
}

//CAIDA
if (place_meeting(x, y + _v_speed, obj_jarri_wall)) {
	while (!place_meeting(x, y + sign(_v_speed), obj_jarri_wall)) {
		y = y + sign(_v_speed)
	}
	_v_speed = 0
}

x = x + _h_speed
y = y + _v_speed
}

if(dead) {
	_available = false
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