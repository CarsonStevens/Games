/// @description destroy both ships/thrust

//Create Blowup
with(instance_create_layer(x,y,layer,objBlowUp)){}

//Crash Sound
audio_sound_gain(Crash, 1.5, 0);
audio_play_sound(Crash,1,false);

//Destroy ship 2 thrust and ship
if(objSpaceShip2.thrusting){
	with(objThrust2)instance_destroy();
}
with(objSpaceShip2) instance_destroy();

//Destroy ship 1 thrust and ship
if(objSpaceShip.thrusting){
	with(objThrust1) instance_destroy();
}
instance_destroy();

