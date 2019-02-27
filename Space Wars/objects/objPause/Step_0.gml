/// @description Pause fading and activation

//For two player
if instance_exists(objSpaceShip) && instance_exists(objSpaceShip2){
	var ship1_distance = distance_to_object(objSpaceShip);
	var ship2_distance = distance_to_object(objSpaceShip2);

	if(ship1_distance < 400 || ship2_distance < 400){
		draw_set_alpha(min(ship1_distance, ship2_distance)/400);
	}
	else{
		draw_set_alpha(1);
	}
}

//For single player
if instance_exists(objSpaceShip) && room == Solo {
	var ship1_distance = distance_to_object(objSpaceShip);

	if(ship1_distance < 400){
		draw_set_alpha(ship1_distance/400);
	}
	else{
		draw_set_alpha(1);
	}
}

if(place_meeting(mouse_x,mouse_y,objPause) && mouse_check_button_pressed(mb_left){
	