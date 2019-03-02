con = obj_controller_emboss;

gpu_set_texrepeat(false);
if con.shader_enabled shader_set(shd_emboss);
    shader_set_uniform_f(con.uni_resolution, var_sprite_width, var_sprite_height);
    draw_sprite(spr_walk,image_index,x,y);
shader_reset();

