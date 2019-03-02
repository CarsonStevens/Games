/// @description destroy ship

//Delete thrust if thrusting while dying
if(objSpaceShip.thrusting){
	with(objThrust1){
		instance_destroy();
	}
}


with(instance_create_layer(x,y,layer,objBlowUp)){}

//Crash Sound
audio_sound_gain(Crash, 1.5, 0);
audio_play_sound(Crash,1,false);
with(objSpaceShip) instance_destroy();
instance_destroy();

//Update Playerscore
global.player_two_score++;


