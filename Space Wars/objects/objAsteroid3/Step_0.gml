/// @description movement and gravity

//Update for gravity
var x_grv = x - objSun.x;
var y_grv = y - objSun.y;
var r_mag = sqrt(x_grv*x_grv + y_grv*y_grv);
x_acc -= objSun.GRAV * x_grv / (r_mag*r_mag*r_mag);
y_acc -= objSun.GRAV * y_grv / (r_mag*r_mag*r_mag);

if((sqrt(x_vel*x_vel + y_vel*y_vel)) < 4){
	//Final x update
	x_vel += x_acc * gravity_strength;
	//Final y update
	y_vel += y_acc * gravity_strength;
}

x += x_vel;
y += y_vel;	

//Rotation movement
image_angle += rotation;

//Screen wrapping
if(x > room_width) x = 0;
if(x < 0) x = room_width;
if(y > room_height) y = 0;
if (y < 0) y = room_height;