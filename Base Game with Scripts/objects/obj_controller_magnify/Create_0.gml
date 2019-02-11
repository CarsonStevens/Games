draw_set_color(c_white);

uni_time = shader_get_uniform(shd_magnify,"time");
var_time_var = 0;

uni_mouse_pos = shader_get_uniform(shd_magnify,"mouse_pos");
var_mouse_pos_x = mouse_x - camera_get_view_x(0);
var_mouse_pos_y = mouse_y - camera_get_view_y(0);

uni_resolution = shader_get_uniform(shd_magnify,"resolution");
var_resolution_x = camera_get_view_width(0);
var_resolution_y = camera_get_view_height(0);

uni_circle_radius = shader_get_uniform(shd_magnify,"circleRadius");
var_circle_radius = 0.25; //higher = more waves

uni_circle_zoom_min = shader_get_uniform(shd_magnify,"minZoom");
var_circle_zoom_min = 0.4; //higher = less distortion

uni_circle_zoom_max = shader_get_uniform(shd_magnify,"maxZoom");
var_circle_zoom_max = 0.6; //higher = faster

shader_enabled = true;
full_screen_effect = true;

surf = surface_create(camera_get_view_width(0), camera_get_view_height(0));
view_set_surface_id(0, surf);