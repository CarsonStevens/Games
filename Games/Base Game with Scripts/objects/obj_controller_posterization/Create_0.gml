draw_set_color(c_white);

uni_time = shader_get_uniform(shd_posterization,"time");
var_time_var = 0;

uni_mouse_pos = shader_get_uniform(shd_posterization,"mouse_pos");
var_mouse_pos_x = mouse_x - camera_get_view_x(0);
var_mouse_pos_y = mouse_y - camera_get_view_y(0);

uni_resolution = shader_get_uniform(shd_posterization,"resolution");
var_resolution_x = camera_get_view_width(0);
var_resolution_y = camera_get_view_height(0);

uni_gamma = shader_get_uniform(shd_posterization,"gamma");
var_gamma = 0.6;

uni_num_colors = shader_get_uniform(shd_posterization,"numColors");
var_num_colors = 8.0;

shader_enabled = true;
full_screen_effect = true;

surf = surface_create(camera_get_view_width(0), camera_get_view_height(0));
view_set_surface_id(0, surf);