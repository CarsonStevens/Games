/// @description destory ship

//Delete thrust if thrusting while dying
if(objSpaceShip2.thrusting){
	with(objThrust2){
		instance_destroy();
	}
}


with(instance_create_layer(x,y,layer,objBlowUp)){}

//Crash Sound
audio_sound_gain(Crash, 1.5, 0);
audio_play_sound(Crash,1,false);
with(objSpaceShip2) instance_destroy();
instance_destroy();
global.player_one_score++;


//Update player_score
global.player_one_score++;

//Destroy Missile
instance_destroy();