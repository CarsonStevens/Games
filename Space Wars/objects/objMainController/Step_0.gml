/// @description
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
	if(room == Solo){
		if((instance_number(objAsteroid1) + instance_number(objAstroid2) + instance_number(objAsteroid3)) < 10){
			var temp_x = 0;
			var temp_y = 0;
			if(irandom_range(0,1) == 0){
				temp_x = 0;
			}
			else{
				temp_x = room_width;
			}
				if(irandom_range(0,1) == 0){
				temp_y = 0;
			}
			else{
				temp_y = room_height;
			}
			var choice = irandom_range(0,2);
			if(choice == 0){
				with(instance_create_layer(temp_x, temp_y, layer, objAsteroid1)){}
			}
			if(choice == 1){
				with(instance_create_layer(temp_x, temp_y, layer, objAsteroid2)){}
			}
			if(choice == 2){
				with(instance_create_layer(temp_x, temp_y, layer, objAsteroid3)){}
			}		
		}
	
}