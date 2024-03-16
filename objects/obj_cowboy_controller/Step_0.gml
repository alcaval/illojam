/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
var _enter = keyboard_check_pressed(vk_enter);
var _pause = keyboard_check_pressed(vk_space);

if (_enter)
	{
		cowboy_restart = true;
	}
	
if (_pause)
	{
		play = false;
	}

if (cowboy_restart)
	{
		play = false;
		if instance_exists(obj_cowboy_player) instance_destroy(obj_cowboy_player);
		if instance_exists(obj_car) instance_destroy(obj_car);
		instance_create_layer(obj_cowboy_player_pivot.x,obj_cowboy_player_pivot.y,"cowboy_bebop", obj_cowboy_player)
		obj_timer.visible = true;
		obj_timer.timer = 60;
		cowboy_restart = false;
		obj_spawner.upper_range = 180;
		obj_spawner.lower_range = 90;
		play = true;
	}