/// @description destroy both ships


with(instance_create_layer(x,y,layer,objBlowUp)){}

//Crash Sound
audio_sound_gain(Crash, 1.5, 0);
audio_play_sound(Crash,1,false);
with(objSpaceShip2) instance_destroy();
instance_destroy();

