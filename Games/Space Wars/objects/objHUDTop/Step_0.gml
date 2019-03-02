/// @description For fading
var ship1_distance = distance_to_object(objSpaceShip);
var ship2_distance = distance_to_object(objSpaceShip2);

if(ship1_distance < 400 || ship2_distance < 400){
	image_alpha = min(ship1_distance, ship2_distance)/400;
}
else{
	image_alpha = 1;
}

