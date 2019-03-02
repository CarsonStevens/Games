//room cycling mechanism, skip first room (init)
if keyboard_check_pressed(vk_space)
{
if !(room==room_last) room_goto_next();
else room_goto(room_first+1)
}

//Mostly keybindings for the demo
with DBobject
{
if keyboard_check(ord("G")){zoomfactor=zoomfactor+0.01;}
if keyboard_check(ord("H")){zoomfactor=zoomfactor-0.01;}
if keyboard_check(ord("D")){manual_x=manual_x+0.1;}
if keyboard_check(ord("A")){manual_x=manual_x-0.1;}
if keyboard_check(ord("W")){manual_y=manual_y-0.1;}
if keyboard_check(ord("S")){manual_y=manual_y+0.1;}
if keyboard_check_pressed(vk_f12){bgdebug=!bgdebug;show_debug_overlay(bgdebug)}
}

//view adjustment to window
__view_set( e__VW.HView, 0, window_get_height( ))
__view_set( e__VW.WView, 0, window_get_width( ))
__view_set( e__VW.HPort, 0, window_get_height( ))
__view_set( e__VW.WPort, 0, window_get_width( ))

//get view object exactly in the center
__view_set( e__VW.HBorder, 0, 0.5*__view_get( e__VW.WView, 0 ) )
__view_set( e__VW.VBorder, 0, 0.5*__view_get( e__VW.HView, 0 ) )



