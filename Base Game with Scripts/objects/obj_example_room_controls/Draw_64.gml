var w=640;
var h=480;
display_set_gui_size(w,h);
draw_set_colour(c_white);
draw_set_font(fnt_music_example);

draw_set_halign(fa_center);
draw_text(w/2,0,string_hash_to_newline("GRUMBLE LABS ADAPTIVE MUSIC PLAYER EXAMPLE ROOM"));
draw_text(w/2,20,string_hash_to_newline("(SONGS AND LAYERS ARE ZERO-INDEXED)"));

draw_set_colour(c_dkgray);
draw_rectangle(105,75,295,225,false);


draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_text(110,80,string_hash_to_newline("SONG: " + string(theCurrentSong) + "/" + string(array_height_2d(obj_music_player.song)-1)));
draw_text(110,100,string_hash_to_newline("LAYER: " + string(theCurrentLayer) + "/" + string(array_length_2d(obj_music_player.song,theCurrentSong)-1)));
draw_text(110,120,string_hash_to_newline("PLAYING: " + string(playing)));
draw_text(110,140,string_hash_to_newline("PAUSED: " + string(paused)));
draw_text(110,160,string_hash_to_newline("LOOPING: " + string(looping)));
draw_text(110,180,string_hash_to_newline("FADES: " + string(fadesActive)));
draw_text(110,200,string_hash_to_newline("VOLUME: " + string(globalVolume)));


draw_sprite_ext(spr_grumblelabs,0,400,80,0.5,0.5,0,c_white,1.0);

draw_set_colour(c_white);
draw_rectangle(80,255,560,430,false);

draw_set_colour(c_black);
draw_set_halign(fa_center);
draw_text(w/2,260,string_hash_to_newline("SPACE to Play/Fade In/Pause"));
draw_text(w/2,280,string_hash_to_newline("ENTER to Stop/Fade Out"));
draw_text(w/2,300,string_hash_to_newline("NUMBERS to Select Song"));
draw_text(w/2,320,string_hash_to_newline("SHIFT-NUMBERS to Select Layer"));
draw_text(w/2,340,string_hash_to_newline("CTRL to Toggle Looping"));
draw_text(w/2,360,string_hash_to_newline("ALT to Toggle Fade-Ins and Fade-Outs"));
draw_text(w/2,380,string_hash_to_newline("PLUS to Increase Global Volume"));
draw_text(w/2,400,string_hash_to_newline("MINUS to Decrease Global Volume"));

draw_set_colour(c_white);
draw_text(w/2,450,string_hash_to_newline("VISIT WWW.GRUMBLELABS.COM FOR MORE MUSIC"));

