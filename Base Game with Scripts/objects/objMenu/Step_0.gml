/// @description Control Menu

//Item ease in
menu_x += (menu_x_taget - menu_x) / menu_speed;

//Keyboard Control
if(menu_control){
	if(keyboard_check_pressed(vk_up)){
		menu_cursor++;
		if(menu_cursor >= menu_items) menu_cursor = 0;
	}
	if(keyboard_check_pressed(vk_down)){
		menu_cursor--;
		if(menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	if(keyboard_check_pressed(vk_enter)){
		menu_x_target = gui_width + 200;
		menu_committed = menu_cursor;
		//ScreenShake(4, 30);
		menu_control = false;
	}
}

//REMOVED FOR BUG ISSUES: (menu_x > gui_width+150) && 
if(menu_committed != -1){
	switch(menu_committed){

		case 0:{
			game_end();
			break;
		}
		case 1:{
			if(!file_exists(SAVEFILE)){
				SlideTransition(TRANS_MODE.NEXT);
			}
			else{
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				file_text_close(file);
				SlideTransition(TRANS_MODE.GOTO, target);
			}
			break;
		}
		case 2:{
			SlideTransition(TRANS_MODE.NEXT);
			break;
		}

			
	}
}