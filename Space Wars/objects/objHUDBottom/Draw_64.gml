/// @description update stats

//For two player
if instance_exists(objSpaceShip){
	//for fading
	var ship1_distance = distance_to_object(objSpaceShip);
	var ship2_distance = distance_to_object(objSpaceShip2);

	if(ship1_distance < 400 || ship2_distance < 400){
		draw_set_alpha(min(ship1_distance, ship2_distance)/400);
	}
	else{
		draw_set_alpha(1);
	}

	var missile_level = (objSpaceShip.missiles / objSpaceShip.missiles_max) * 100;
	var fuel_level = (objSpaceShip.fuel / objSpaceShip.fuel_max) * 100;

	//For fuel
	draw_healthbar(630, 1640, 875, 1680, missile_level, c_black, c_red, c_lime, 0, false, true);

	//For Missiles
	draw_healthbar(155, 1640, 400, 1680, fuel_level, c_black, c_red, c_aqua, 0, false, true);
}

//For single player
if instance_exists(objSpaceShip) && room == Solo {
	//for fading
	var ship1_distance = distance_to_object(objSpaceShip);

	if(ship1_distance < 400){
		draw_set_alpha(ship1_distance/400);
	}
	else{
		draw_set_alpha(1);
	}

	var missile_level = (objSpaceShip.missiles / objSpaceShip.missiles_max) * 100;
	var fuel_level = (objSpaceShip.fuel / objSpaceShip.fuel_max) * 100;

	//For fuel
	draw_healthbar(630, 1640, 875, 1680, missile_level, c_black, c_red, c_lime, 0, false, true);

	//For Missiles
	draw_healthbar(155, 1640, 400, 1680, fuel_level, c_black, c_red, c_aqua, 0, false, true);
	

}

//For player_score
draw_set_color(c_white);
draw_set_font(fntScore);
draw_text(300, 1500, global.player_one_score);