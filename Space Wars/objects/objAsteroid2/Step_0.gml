/// @description movement and gravity

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

//Rotation movement
image_angle += rotation;
