/// @description
with(instance_create_layer(x,y,layer,objBlowUp)){}
instance_destroy();

//Crash Sound
audio_sound_gain(Crash, 1.5, 0);
audio_play_sound(Crash,1,false);