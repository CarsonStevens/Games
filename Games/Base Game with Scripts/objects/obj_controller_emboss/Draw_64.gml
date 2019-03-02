if shader_enabled shader_set(shd_emboss);
    shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
    draw_surface(surf,0,0);
shader_reset();

draw_text(0,0,string_hash_to_newline("Real FPS: "+string(fps_real)));

draw_text(0,60,string_hash_to_newline("Spacebar to toggle shader"));
draw_text(0,72,string_hash_to_newline("Shift key to toggle fullscreen or sprite only"));
draw_text(0,84,string_hash_to_newline("Escape key to exit"));