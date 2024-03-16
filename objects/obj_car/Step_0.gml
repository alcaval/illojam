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

