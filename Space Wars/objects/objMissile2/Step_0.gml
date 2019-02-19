/// @description move missile


var x_grv = x - objSun.x;
var y_grv = y - objSun.y;
var r_mag = sqrt(x_grv*x_grv + y_grv*y_grv);
var x_acc = objSun.GRAV * x_grv / (r_mag*r_mag*r_mag);
var y_acc = objSun.GRAV * y_grv / (r_mag*r_mag*r_mag);



//Final x update
x_vel += -thrust_const * sin(degtorad(image_angle)) - x_acc;
x += x_vel;
//Final y update
y_vel += -thrust_const * cos(degtorad(image_angle)) - y_acc;
y += y_vel;


//Screen wrapping
if(x > room_width) x = 0;
if(x < 0) x = room_width;
if(y > room_height) y = 0;
if (y < 0) y = room_height;
