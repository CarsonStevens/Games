/// @description Draw State History
if(ds_list_empty(state_history)) exit;

var _str="STATE HISTORY\n";
var _max_history = 10;
for(var _i=0; _i<_max_history && _i<ds_list_size(state_history); _i++)
{
	_str+=state_history[| _i]+"\n";
}
var _margin=20;
draw_set_color(c_black);
draw_set_alpha(.5);
draw_rectangle(_margin,_margin,string_width(_str)+_margin*3,string_height(_str)+_margin*3,false);
draw_set_alpha(1);
draw_set_text_alignment(Text.left_top,c_white);
draw_text(_margin*2,_margin*2,_str);