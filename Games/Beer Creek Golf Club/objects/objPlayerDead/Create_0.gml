hsp = 3;
vsp = -2;
grv = 0.2;
done = 0;

ScreenShake(30, 60);
image_speed = 1;
image_index = 0;

//psuedo slowmo
game_set_speed(30, fps);
//Changes camera to follow the dead player instead of the live player
with(objCamera) follow = other.id;