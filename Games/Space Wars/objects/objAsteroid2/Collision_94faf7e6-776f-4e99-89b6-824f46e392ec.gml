/// @description For explosion and point
with(instance_create_layer(x,y,layer,objBlowUp2)){
	image_xscale = objAsteroid2.image_xscale;
	image_yscale = objAsteroid2.image_yscale;

}
with(objMissile){
	instance_destroy();
}
instance_destroy();

//Crash Sound
audio_sound_gain(Crash, 1.5, 0);
audio_play_sound(Crash,1,false);

//Give a point
global.player_one_score++;
