/// @description For creation of asteroids

if(room == Solo){
	var a1 = 0;
	var a2 = 0;
	var a3 = 0;
	if(instance_exists(objAsteroid1)){
		a1 = instance_number(objAsteroid1);
	}
	if(instance_exists(objAsteroid2)){
		a2 = instance_number(objAsteroid2);
	}
	if(instance_exists(objAsteroid3)){
		a3 = instance_number(objAsteroid3);
	}
	if((a1 + a2 + a3) < 10){
		var temp_x = 0;
		var temp_y = random_range(0,room_height);
		if(irandom_range(0,1) == 0){
			temp_x = 0;
		}
		else{
			temp_x = room_width;
		}
		var choice = irandom_range(0,2);
		if(choice == 0){
			with(instance_create_layer(temp_x, temp_y, layer, objAsteroid1)){}
		}
		if(choice == 1){
			with(instance_create_layer(temp_x, temp_y, layer, objAsteroid2)){}
		}
		if(choice == 2){
			with(instance_create_layer(temp_x, temp_y, layer, objAsteroid3)){}
		}		
	}
}
alarm[0] = 240;
