if(done == 0){
	//Applies gravity
	vsp += grv;
	//frame_counter++;

	/*
	 * Collision Code:
	 * sign(): gives sign of var
	 *
	 * FIX: Flags for animation instead of checking
	 *
	 *
	*/

	//Horizontal Collision
	if(place_meeting(x + hsp, y, objConcrete)){
		while(!place_meeting(x + sign(hsp), y, objConcrete)){
			x += sign(hsp);
		}	
		hsp = 0;
	}


	//Vertical Collision
	if(place_meeting(x, y + vsp, objConcrete)){
		//Sets done if object is falling
		if(vsp > 0){
			done = 1;
			
		}
		
		while(!place_meeting(x, y + sign(vsp), objConcrete)){
			y += sign(vsp);
		}
		
		vsp = 0;
	}


	x += hsp;
	y += vsp;
}



