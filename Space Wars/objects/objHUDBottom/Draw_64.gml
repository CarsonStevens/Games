/// @description update stats

if instance_exists(objSpaceShip){
	//for fading
	var ship1_distance = distance_to_object(objSpaceShip);
	var ship2_distance = distance_to_object(objSpaceShip2);

	if(ship1_distance < 400 || ship2_distance < 400){
		draw_set_alpha(min(ship1_distance, ship2_distance)/400);
	}
	else{
		draw_set_alpha(1)
	}


	//For fuel
	var fuel_level = (objSpaceShip.fuel / objSpaceShip.fuel_max) * 100;
	draw_healthbar(630, 1640, 875, 1680, fuel_level, c_black, c_red, c_lime, 0, false, true)

	//For Missiles
	var missile_level = (objSpaceShip.missiles / objSpaceShip.missiles_max) * 100;
	draw_healthbar(155, 1640, 400, 1680, missile_level, c_black, c_red, c_aqua, 0, false, true)
}