if (playing && !obj_music_player.currentlyPlaying) {
    playing = false;
}

// Handle Layer Requests
if (keyboard_check(vk_shift)) {
    var hitLayer = false;
    if (keyboard_check_pressed(ord("0"))) {
        theCurrentLayer = 0;        
        hitLayer = true;
    }
    
    else if (keyboard_check_pressed(ord("1"))) {
        theCurrentLayer = 1;    
        hitLayer = true;
    }
    
    else if (keyboard_check_pressed(ord("2"))) {
        theCurrentLayer = 2;
        hitLayer = true;
    }
    
    else if (keyboard_check_pressed(ord("3"))) {
        theCurrentLayer = 3;
        hitLayer = true;
    }
    
    if (hitLayer) {
        if (theCurrentLayer != obj_music_player.currentLayerNumber) {
            if (playing) {
                with (obj_music_player) scr_music_crossfade_layer(other.theCurrentLayer,other.crossfadeTime);
            }
        }
    }
}

// Handle Song Requests
else {
    var hitSong = false;
    if (keyboard_check_pressed(ord("0"))) {
        theCurrentSong = 0;
        hitSong = true;
    }
    
    else if (keyboard_check_pressed(ord("1"))) {
        theCurrentSong = 1;
        hitSong = true;
    }
    
    else if (keyboard_check_pressed(ord("2"))) {
        theCurrentSong = 2;
        hitSong = true;
    }
    
    else if (keyboard_check_pressed(ord("3"))) {
        theCurrentSong = 3;
        hitSong = true;
    }
    
    else if (keyboard_check_pressed(ord("4"))) {
        theCurrentSong = 4;
        hitSong = true;
    }
    
    else if (keyboard_check_pressed(ord("5"))) {
        theCurrentSong = 5;
        hitSong = true;
    }
    
    else if (keyboard_check_pressed(ord("6"))) {
        theCurrentSong = 6;
        hitSong = true;
    }
    
    else if (keyboard_check_pressed(ord("7"))) {
        theCurrentSong = 7;
        hitSong = true;
    }
    
    else if (keyboard_check_pressed(ord("8"))) {
        theCurrentSong = 8;   
        hitSong = true;
    }
    
    if (hitSong) {
        if (theCurrentSong != obj_music_player.currentSongNumber) {
            if (playing) {
                with (obj_music_player) scr_music_play(other.theCurrentSong,other.theCurrentLayer,other.priority,other.looping,other.crossfadeTime);
            }
        }
    }
}


// Transport Controls

// The Play/Pause Button
if (keyboard_check_pressed(vk_space)) {
    if (!playing) {
        if (!fadesActive) {
            with (obj_music_player) scr_music_play(other.theCurrentSong,other.theCurrentLayer,other.priority,other.looping,other.crossfadeTime);
        }
        else {
            with (obj_music_player) scr_music_fadein_play(other.theCurrentSong,other.theCurrentLayer,other.priority,other.looping,other.crossfadeTime);
        }
        playing = true;
    }
    else {
        if (!paused) {
            with (obj_music_player) scr_music_pause();
            paused = true;
        }
        else {
            with (obj_music_player) scr_music_unpause();
            paused = false;
        }
    }
}

else if (keyboard_check_pressed(vk_enter)) {
    if (playing) {
        if (!fadesActive) {
            with (obj_music_player) scr_music_stop();
        }
        else {
            with (obj_music_player) scr_music_fadeout(other.crossfadeTime);
        }
        playing = false;
    }
    paused = false;
}

else if (keyboard_check_pressed(vk_add)) {
    globalVolume = clamp(globalVolume+0.1,0.0,1.0);
    with (obj_music_player) scr_music_set_global_volume(other.globalVolume);
}

else if (keyboard_check_pressed(vk_subtract)) {
    globalVolume = clamp(globalVolume-0.1,0.0,1.0);
    with (obj_music_player) scr_music_set_global_volume(other.globalVolume);
}

else if (keyboard_check_pressed(vk_alt)) {
    fadesActive = !fadesActive;
}

else if (keyboard_check_pressed(vk_control)) {
    looping = !looping;
    obj_music_player.currentlyLooping = looping;
}

