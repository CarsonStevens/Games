/// @description control general sound
if(room == Menu){
	if(audio_is_playing(MainTrack)) audio_stop_sound(MainTrack);
	audio_sound_gain(IntroTrack, 0.1, 0.7);
	audio_play_sound(IntroTrack, 0, true);
}
if(room == Level1) {
    if(audio_is_playing(IntroTrack)) audio_stop_sound(IntroTrack);
	audio_sound_gain(MainTrack, 0.1, 0.7);
	audio_play_sound(MainTrack, 0, true);
}

