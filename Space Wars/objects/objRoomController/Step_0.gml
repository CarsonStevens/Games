/// @description Control which room to go to

//Menu to Level 1
if keyboard_check(vk_space){
	if(room == Menu){
		//destory opening menu
		with(objLogo) instance_destroy();
		with(objContinue) instance_destroy();
		//Create options for player
		with(instance_create_layer(room_width/2, room_height/2 - 300, layer, objSinglePlayer)){}
		with(instance_create_layer(room_width/2, room_height/2 + 300, layer, objTwoPlayer)){}
	}
	if(room == SoloInstructions){
		room_goto(Solo);
	}
	if(room == TwoPlayerInstructions){
		room_goto(Level1);
	}
}


if(global.player_one_score == global.win_score || global.player_two_score == global.win_score) && room == Level1{
	room_goto(EndTwoPlayer);
}
