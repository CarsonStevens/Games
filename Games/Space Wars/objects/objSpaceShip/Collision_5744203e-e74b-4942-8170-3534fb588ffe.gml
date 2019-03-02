/// @description If ship hit sun

with(instance_create_layer(x,y,"Instances", objBlowUp)){}
instance_destroy();
audio_play_sound(Crash,1,false);