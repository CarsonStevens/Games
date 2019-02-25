/// @description destory ship

//Delete thrust if thrusting while dying
if(objSpaceShip2.thrusting){
	with(objThrust2){
		instance_destroy();
	}
}


if(activated){
	with(instance_create_layer(x,y,layer,objBlowUp)){}

	//Crash Sound
	audio_sound_gain(Crash, 1.5, 0);
	audio_play_sound(Crash,1,false);
	with(objSpaceShip2) instance_destroy();
}