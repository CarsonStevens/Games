///Keyboard checks

if keyboard_check(ord("Q")) var_shock_amplitude += 0.5;
if keyboard_check(ord("A")) var_shock_amplitude -= 0.5;

if keyboard_check(ord("W")) var_shock_refraction += 0.05;
if keyboard_check(ord("S")) var_shock_refraction -= 0.05;

if keyboard_check(ord("E")) var_shock_width += 0.001;
if keyboard_check(ord("D")) var_shock_width -= 0.001;

if mouse_check_button(mb_left) and shock_enabled = false
{
    shock_enabled = true;
	var_mouse_pos_x = mouse_x - camera_get_view_x(0);
	var_mouse_pos_y = mouse_y - camera_get_view_y(0);;
    alarm[0] = 280;
}

