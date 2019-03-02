/// @description Draw Menu

//Set font
draw_set_font(fMenu);

//Horizontal and Vertial font allignment
//Should set each time text is used
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

//Use var because temp variable
for(var i = 0; i < menu_items; i++){
	
	var offset = 2
	var txt = menu[i];
	if(menu_cursor == i){
		//To point at object selected
		txt = string_insert("> ", txt, 0);
		// Color of text
		var col = c_white
	}
	else{
		var col = c_gray;
	}
	
	var xx = menu_x;
	//"i * 1.5" so Items don't overlap
	var yy = menu_y - (menu_itemheight * (i * 1.5));
	
	//For overlapping to make bubble text;
	draw_set_color(c_black);
	draw_text(xx - offset, yy, txt);
	draw_text(xx, yy - offset, txt);
	draw_text(xx + offset, yy, txt);
	draw_text(xx, yy + offset, txt);
	
	//Reset and draw
	draw_set_color(col); //Set color for if selected or not
	draw_text(xx,yy,txt);
}

//DEBUG
//draw_text(600, 200, "Cursor: " + string(menu_cursor) + "    Committed: " + string(menu_committed));