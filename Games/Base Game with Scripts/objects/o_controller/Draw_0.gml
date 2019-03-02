lut_texture = sprite_get_texture(s_lut, index);
shader_set(sh_lut);
texture_set_stage(lut_sampler, lut_texture);
draw_sprite(s_sprite, 0, 0, 0);
shader_reset();

draw_set_colour($b98029);
draw_rectangle(0, 16, 1280, 64, 0);
draw_set_colour(c_white);
draw_text(640-string_width(string(str))/2, 24, string(str));
draw_sprite_ext(s_lut, index, 0, 0, 0.25, 0.25, 0, c_white, 1);