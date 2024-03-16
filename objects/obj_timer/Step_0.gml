/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if(obj_cowboy_controller.play){
	if(timer > 0)
	{
		timer = timer - delta_time/1000000;

	} else {
		timer = 0;
		obj_cowboy_controller.play = false;
		draw_text(x,y, "Victoria royale");
	}
	show_time = ceil(timer);
}
