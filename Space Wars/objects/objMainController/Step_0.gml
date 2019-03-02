/// @description Handling end game and Asteroid creation

if(!scored){
	//Handle Scoring
	if(room == EndTwoPlayer){
		if(global.player_one_score > global.player_two_score){
			with(instance_create_layer(room_width/2, room_height/2, "HUD", objWin1)){}
		}
		if(global.player_two_score > global.player_one_score){
			with(instance_create_layer(room_width/2, room_height/2, "HUD", objWin2)){}
		}
		if(global.player_one_score == global.player_two_score){
			with(instance_create_layer(room_width/2, room_height/2, "HUD", objDraw)){}
		}
		scored = true;
	}

	if(room == EndSolo){
		with(instance_create_layer(room_width/2, room_height/2, "HUD", objScore)){}
		scored = true;
	}
}