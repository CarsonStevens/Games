draw_set_color(c_white);

uni_resolution = shader_get_uniform(shd_refraction,"u_resolution");
var_resolution_x = camera_get_view_width(0);
var_resolution_y = camera_get_view_height(0);

uni_texture_resolution = shader_get_uniform(shd_refraction,"u_textureRes");
uni_texture_position = shader_get_uniform(shd_refraction,"u_texturePos");
var_refraction_amount = 0.03;

samp_normal_map = shader_get_sampler_index(shd_refraction, "s_normalMap");
samp_diffuse_tex = shader_get_sampler_index(shd_refraction, "s_diffuseTex");

bg_Normal_Map = sprite_get_texture(bac_refraction_normal, -1);  
bg_Normal_Map_width = sprite_get_width(bac_refraction_normal);
bg_Normal_Map_height = sprite_get_height(bac_refraction_normal);

bg_Diffuse_Tex = sprite_get_texture(bac_refraction_diffuse, -1);

shader_enabled = true;

surf = surface_create(camera_get_view_width(0), camera_get_view_height(0));
view_set_surface_id(0, surf);