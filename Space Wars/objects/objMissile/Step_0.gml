/// @description move missile

//Final x update
x_vel += -thrust_const * sin(degtorad(image_angle));
x += x_vel;
//Final y update
y_vel += -thrust_const * cos(degtorad(image_angle));
y += y_vel;


//Screen wrapping
if(x > room_width) x = 0;
if(x < 0) x = room_width;
if(y > room_height) y = 0;
if (y < 0) y = room_height;
