/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if(spawn && obj_cowboy_controller.play){
	
	var _aux_car = irandom_range(0,5);
	switch _aux_car {
	
		case(0): {
			instance_create_layer(1100, random_range(top_spawn_coordinate, down_spawn_coordinate), "cowboy_bebop", obj_car_slow); 
			break;
		}
		
		case(1): {
			instance_create_layer(1300, random_range(top_spawn_coordinate, down_spawn_coordinate), "cowboy_bebop", obj_car_fast); 
			break;
		}
		
		default: instance_create_layer(1300, random_range(top_spawn_coordinate, down_spawn_coordinate), "cowboy_bebop", obj_car_mid);
		
	}
	spawn = false;
	alarm[0] = random_range(lower_range,upper_range)
	if (lower_range > 30) lower_range -= 10;
	if (lower_range > 60) upper_range -= 10;
}