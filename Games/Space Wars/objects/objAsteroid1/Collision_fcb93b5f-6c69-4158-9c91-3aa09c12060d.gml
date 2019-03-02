/// @description Blow up
with(instance_create_layer(x,y,layer,objBlowUp2)){
	image_xscale = objAsteroid1.image_xscale;
	image_yscale = objAsteroid1.image_yscale;

}
instance_destroy();

//Crash Sound
audio_sound_gain(Crash, 1.5, 0);
audio_play_sound(Crash,1,false);

