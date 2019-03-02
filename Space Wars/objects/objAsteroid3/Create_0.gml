/// @description Variable Setup

//kinemetics
x_vel = random_range(-2,2);
y_vel = random_range(-2,2);
x_acc = 0;
y_acc = 0;
gravity_strength = 0.2;

//For size and rotation
rotation = random_range(-5,5);
size = random_range(-2,2);
//To make sure the astroids aren't too small
if(size < 0.5 && size > -0.5){
	size = 0.5;
}
image_xscale = size;
image_yscale = size;




