/// @description Die
//Destroy player gun
with(objGun) instance_destroy();

//True or false for perform events. Whether or not we preform the destroy 
//event for this and create event for the other.
instance_change(objPlayerDead, true);

direction = point_direction(other.x, other.y, x, y);
hsp = lengthdir_x(6, direction);
vsp = lengthdir_y(4, direction)-2;
if(sign(hsp) != 0) image_xscale = sign(hsp);