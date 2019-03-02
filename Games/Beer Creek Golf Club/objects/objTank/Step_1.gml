if(instance_exists(objPlayer)){
	x = objPlayer.x;
	y = objPlayer.y;

	image_xscale = objPlayer.image_xscale;
}
else{
	speed = 7;
	//Other in with statement refers to current obj (gun)
	direction = other.image_angle + random_range(-50, 50);
	image_angle = direction;
}
