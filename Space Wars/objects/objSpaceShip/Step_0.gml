/// @description for movement

/*
//DEBUG
if(objScoreController.solo == true){
	draw_set_color(c_lime);
	draw_set_font(fntScoreFinal);
	draw_text(room_width/2 + 40, room_height/2 - 100, "SOLO");
}
else{
	draw_set_color(c_lime);
	draw_set_font(fntScoreFinal);
	draw_text(room_width/2 + 40, room_height/2 - 100, "NOT SOLO");
}
*/

//Reset inputs
rotation = 0;
firing_delay--;
thrusting = false;

//Input variables
key_thrust = keyboard_check(vk_up);
key_clockwise = keyboard_check(vk_right);
key_counter_clockwise = keyboard_check(vk_left);
key_fire = keyboard_check(vk_down);


//Update thrust and rotation from input
rotation = (key_counter_clockwise - key_clockwise);

//Update accelerations from thrust
if(key_thrust) && fuel > 0 {
	x_acc = -thrust_const * sin(degtorad(image_angle));
	y_acc = -thrust_const * cos(degtorad(image_angle));
	thrusting = true;
	fuel--;
}
else{
	x_acc = 0;
	y_acc = 0;
}


//Update for gravity
var x_grv = x - objSun.x;
var y_grv = y - objSun.y;
var r_mag = sqrt(x_grv*x_grv + y_grv*y_grv);
x_acc -= objSun.GRAV * x_grv / (r_mag*r_mag*r_mag);
y_acc -= objSun.GRAV * y_grv / (r_mag*r_mag*r_mag);


//Final x update
x_vel += x_acc;
//Final y update
y_vel += y_acc;
x += x_vel;
y += y_vel;	

//Update image angle
image_angle += rotation * rotation_const;

//Screen wrapping
if(x > room_width) x = 0;
if(x < 0) x = room_width;
if(y > room_height) y = 0;
if (y < 0) y = room_height;

//Handle Firing
if(key_fire && (firing_delay < 0) && missiles > 0){
	firing_delay = 50;
	missiles--;
	with(instance_create_layer(x,y, "Missiles", objMissile)){
		audio_sound_gain(MissileFire, 1.5, 0.3);
		audio_play_sound(MissileFire,1,false);
		image_angle = objSpaceShip.image_angle;
	}
}

//Handle Thrusting
if(thrusting){
	with(instance_create_layer(x,y, "Missiles", objThrust1)){
		if !(audio_is_playing(Thrust1)){
		audio_sound_gain(Thrust1, 5, 0.3);
		audio_play_sound(Thrust1,1,true);
		}
		image_angle = objSpaceShip.image_angle;
	}
}
else{
	audio_stop_sound(Thrust1);
}
