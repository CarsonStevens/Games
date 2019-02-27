/// @description Pause fading

//For two player
if instance_exists(objSpaceShip) && instance_exists(objSpaceShip2){
	var ship1_distance = distance_to_object(objSpaceShip);
	var ship2_distance = distance_to_object(objSpaceShip2);

	if(ship1_distance < 200 || ship2_distance < 200){
		draw_set_alpha(min(ship1_distance, ship2_distance)/200);
	}
	else{
		draw_set_alpha(1);
	}
}

//For single player
if instance_exists(objSpaceShip) && room == Solo {
	var ship1_distance = distance_to_object(objSpaceShip);

	if(ship1_distance < 200){
		draw_set_alpha(ship1_distance/200);
	}
	else{
		draw_set_alpha(1);
	}
}

// If pushed, make solid
if(activated){
	draw_set_alpha(1);
}

	