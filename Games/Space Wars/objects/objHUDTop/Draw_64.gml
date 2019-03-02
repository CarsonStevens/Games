/// @description update stats
if instance_exists(objSpaceShip2){
	var ship1_distance = distance_to_object(objSpaceShip);
	var ship2_distance = distance_to_object(objSpaceShip2);

	if(ship1_distance < 400 || ship2_distance < 400){
		draw_set_alpha(min(ship1_distance, ship2_distance)/400);
	}
	else{
		draw_set_alpha(1);
	}

	//font_add(starcraft.ttf, 100, bold, italic, 32, 128);


	var fuel_level = (objSpaceShip2.fuel / objSpaceShip2.fuel_max) * 100;
	var missile_level = (objSpaceShip2.missiles / objSpaceShip2.missiles_max) * 100;
	
	//For fuel
	draw_healthbar(825, 20, 1070, 60, missile_level, c_black, c_red, c_lime, 1, false, true);

	//For Missiles
	draw_healthbar(1300, 20, 1545, 60, fuel_level, c_black, c_red, c_aqua, 1, false, true);
	
	
}

//For player_score
draw_set_color(c_white);
draw_set_font(fntScore);
draw_text(1545, 75, global.player_two_score);
//font_delete