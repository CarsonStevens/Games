draw_set_color(c_white);

uni_time = shader_get_uniform(shd_greyscale,"time");
var_time_var = 0;

uni_mouse_pos = shader_get_uniform(shd_greyscale,"mouse_pos");
var_mouse_pos_x = mouse_x - camera_get_view_x(0);
var_mouse_pos_y = mouse_y - camera_get_view_y(0);

uni_resolution = shader_get_uniform(shd_greyscale,"resolution");
var_resolution_x = camera_get_view_width(0);
var_resolution_y = camera_get_view_height(0);

uni_greyscale_fade = shader_get_uniform(shd_greyscale,"fade");
var_greyscale_fade = 0.5;

shader_enabled = true;
full_screen_effect = true;

surf = surface_create(var_resolution_x, var_resolution_y);
view_set_surface_id(0, surf);