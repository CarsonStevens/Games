/// @description for movement

//Reset inputs
rotation = 0;
firing_delay--;

//Input variables
key_thrust = keyboard_check(ord("W"));
key_clockwise = keyboard_check(ord("D"));
key_counter_clockwise = keyboard_check(ord("A"));
key_fire = keyboard_check(ord("S"));


//Update thrust and rotation from input
rotation = (key_counter_clockwise - key_clockwise);

//Update accelerations from thrust
if(key_thrust){
	x_acc = -thrust_const * sin(degtorad(image_angle));
	y_acc = -thrust_const * cos(degtorad(image_angle));
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
x += x_vel;
//Final y update
y_vel += y_acc;
y += y_vel;

//Update image angle
image_angle += rotation * rotation_const;

//Screen wrapping
if(x > room_width) x = 0;
if(x < 0) x = room_width;
if(y > room_height) y = 0;
if (y < 0) y = room_height;

//Handle Firing
if(key_fire && (firing_delay < 0)){
	firing_delay = 50;
	with(instance_create_layer(x,y, "Missiles", objMissile2)){
		audio_sound_gain(MissileFire, 1.5, 0.3);
		audio_play_sound(MissileFire,1,false);
		image_angle = objSpaceShip2.image_angle;
	}
}