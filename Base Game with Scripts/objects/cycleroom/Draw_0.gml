/// @description Text for the examples, not very exciting.

bla=draw_get_color();
draw_set_font(DBfont)
draw_set_color(c_yellow)
draw_text(__view_get( e__VW.XView, 0 )+0.5*__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+0.5*__view_get( e__VW.HView, 0 )-140,string_hash_to_newline("Space to switch preset - Arrow keys to move around - F12 to toggle debug mode"))
if (room==Example_1) {draw_text_ext(__view_get( e__VW.XView, 0 )+0.5*__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+0.5*__view_get( e__VW.HView, 0 )-400,string_hash_to_newline("Simple stars (simple mode) or stars with nebulas (advanced mode) - Default preset - You can mess around with this preset within the object. ##You can also try out the experimental zoom feature with the G and H keys, right now it's more useful for special effects rather than true zooming. ##As of version v1.1, manual control has been added, it is enabled by default for the first room (this one), use W S A D to pan the background around. VISIT THE LAST ROOM FOR A COOL EXAMPLE!"),20,512);}
if (room==Example_2) {draw_text(__view_get( e__VW.XView, 0 )+0.5*__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+0.5*__view_get( e__VW.HView, 0 )-200,string_hash_to_newline("Red nebula with orange stars"));}
if (room==Example_3) {draw_text(__view_get( e__VW.XView, 0 )+0.5*__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+0.5*__view_get( e__VW.HView, 0 )-200,string_hash_to_newline("Clouds"));}
if (room==Example_4) {draw_text(__view_get( e__VW.XView, 0 )+0.5*__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+0.5*__view_get( e__VW.HView, 0 )-200,string_hash_to_newline("Lightning nebula"));}
if (room==Example_5) {draw_text(__view_get( e__VW.XView, 0 )+0.5*__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+0.5*__view_get( e__VW.HView, 0 )-200,string_hash_to_newline("Rainbow barf"));}
if (room==Example_6) {draw_text(__view_get( e__VW.XView, 0 )+0.5*__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+0.5*__view_get( e__VW.HView, 0 )-200,string_hash_to_newline("Nice stars"));}
if (room==Example_7) {draw_text(__view_get( e__VW.XView, 0 )+0.5*__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+0.5*__view_get( e__VW.HView, 0 )-200,string_hash_to_newline("Photo based clouds"));}
if (room==Example_8) {draw_text(__view_get( e__VW.XView, 0 )+0.5*__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+0.5*__view_get( e__VW.HView, 0 )-200,string_hash_to_newline("A cool fire effect, press W !"));}
draw_set_color(bla)

