/// @description Update Camera

//Update destination
if (instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
	
	if(follow.object_index == objPlayerDead){
		x = xTo;
		y = yTo;
	}
}

//Update camera position
//Divide by 25 to help camera to help more smoothly
	//Fast when far away and slower up close
x += (xTo -x) / 25;
y += (yTo -y) / 25;

//Clamp camera to borders
x = clamp(x, view_w_half + buffer, room_width - view_w_half - buffer);
y = clamp(y, view_h_half + buffer, room_height - view_h_half - buffer);

//For Shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1/shake_length)*shake_magnitude));

//Update camera view
camera_set_view_pos(camera, x - view_w_half, y - view_h_half);

//To optimize, instead of "layer_exists()", in creation, set variable to "layer_get_id()".
if(layer_exists("Mountains")){
	//Manipulates the x value of the layer
	layer_x("Mountains", x/2);
}
if(layer_exists("Trees")){
	layer_x("Trees", x/4);
}