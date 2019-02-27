/// @description Control which room to go to

//Menu to Level 1
if(keyboard_check(vk_space) && room == Menu) room_goto(Level1);

if(global.player_one_score == global.win_score || global.player_two_score == global.win_score) && room == Level1{
	room_goto(EndTwoPlayer);
}
