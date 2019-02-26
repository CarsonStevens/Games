/// @description update stats
if instance_exists(objSpaceShip2){
	var ship1_distance = distance_to_object(objSpaceShip);
	var ship2_distance = distance_to_object(objSpaceShip2);

	if(ship1_distance < 400 || ship2_distance < 400){
		draw_set_alpha(min(ship1_distance, ship2_distance)/400);
	}
	else{
		draw_set_alpha(1)
	}

	//font_add(starcraft.ttf, 100, bold, italic, 32, 128);

	//For fuel
	var fuel_level = (objSpaceShip2.fuel / objSpaceShip2.fuel_max) * 100;
	draw_healthbar(825, 20, 1070, 60, fuel_level, c_black, c_red, c_lime, 1, false, true)

	//For Missiles
	var missile_level = (objSpaceShip2.missiles / objSpaceShip2.missiles_max) * 100;
	draw_healthbar(1300, 20, 1545, 60, missile_level, c_black, c_red, c_aqua, 1, false, true)
}
//font_delete