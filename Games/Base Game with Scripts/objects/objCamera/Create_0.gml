/// @description set up camera
camera = view_camera[0];
follow = objPlayer;
view_w_half = camera_get_view_width(camera) * 0.5;
view_h_half = camera_get_view_height(camera) * 0.5;
xTo = xstart;
yTo = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
//Used to not shake outside of game room
//Make sure buffer is atleast the size of the shake
buffer = 32;