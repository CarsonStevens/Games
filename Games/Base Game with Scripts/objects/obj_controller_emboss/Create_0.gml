draw_set_color(c_white);

uni_resolution = shader_get_uniform(shd_emboss,"resolution");
var_resolution_x = view_wport[0];
var_resolution_y = view_hport[0];

shader_enabled = true;
full_screen_effect = true;

surf = surface_create(view_wview, view_hview);
view_set_surface_id(0, surf);