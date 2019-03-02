/// @description 
//Delete thrust if thrusting while dying
if(objSpaceShip.thrusting){
	with(objThrust1){
		instance_destroy();
	}
}
with(objSpaceShip){
	instance_destroy();
}

with(instance_create_layer(x,y,layer,objBlowUp)){
	image_xscale = objAsteroid3.image_xscale;
	image_yscale = objAsteroid3.image_yscale;

}
instance_destroy();

//Crash Sound
audio_sound_gain(Crash, 1.5, 0);
audio_play_sound(Crash,1,false);